import 'package:adventures_in_tech_world/actions/app/plumb_services.dart';
import 'package:adventures_in_tech_world/actions/auth/connect_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/request_git_hub_auth.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/problem_location.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/services/navigation_service.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:redux/redux.dart';

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createAuthMiddleware({
  AuthService authService,
  NavigationService navigationService,
  GitHubService gitHubService,
  DatabaseService databaseService,
  PlatformService platformService,
}) {
  return [
    PlumbServicesMiddleware(authService, databaseService),
    ConnectAuthStateMiddleware(authService),
    StoreUserDataMiddleware(authService, navigationService, databaseService),
    RequestGitHubAuthMiddleware(platformService),
    StoreGitHubTokenMiddleware(authService, gitHubService),
    SignOutMiddleware(authService, navigationService),
  ];
}

class PlumbServicesMiddleware extends TypedMiddleware<AppState, PlumbServices> {
  PlumbServicesMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              ProblemLocation.plumbServicesMiddleware, store.dispatch);

          /// We don't manage the subscription as the streams are expected
          /// to stay open for the whole lifetime of the app
          try {
            databaseService.storeStream
                .listen(store.dispatch, onError: handleProblem);
            authService.storeStream
                .listen(store.dispatch, onError: handleProblem);
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

class ConnectAuthStateMiddleware
    extends TypedMiddleware<AppState, ConnectAuthState> {
  ConnectAuthStateMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          authService.connectAuthState();
        });
}

class StoreUserDataMiddleware extends TypedMiddleware<AppState, StoreUserData> {
  StoreUserDataMiddleware(AuthService authService,
      NavigationService navigationService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              ProblemLocation.storeUserDataMiddleware, store.dispatch);

          try {
            if (action.userData == null || action.userData.uid == null) {
              if (store.state.authStep == AuthStep.signingOut) {
                // user has signed out so reset the UI
                navigationService.popHome();
              }
              store
                  .dispatch(StoreAuthStep(step: AuthStep.signingInAnonymously));
              await authService.signInAnonymously();
            } else {
              // set the relevant auth state
              if (action.userData.isAnonymous) {
                store.dispatch(
                    StoreAuthState(state: AuthState.signedInAnonymously));
              } else {
                store.dispatch(StoreAuthState(state: AuthState.signedIn));
              }

              // whether we're signed in anonymously or with github we need to
              // get the token from the database
              store.dispatch(
                  StoreAuthStep(step: AuthStep.checkingForGitHubToken));
              databaseService.connectTokensDoc(uid: action.userData.uid);
            }
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

class StoreGitHubTokenMiddleware
    extends TypedMiddleware<AppState, StoreGitHubToken> {
  StoreGitHubTokenMiddleware(
      AuthService authService, GitHubService gitHubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              ProblemLocation.storeGitHubTokenMiddleware, store.dispatch);

          try {
            if (action.token != null) {
              gitHubService.token = action.token;
              // If we got a token and aren't already signed in with github do so
              if (!store.state.userData.hasGitHub) {
                store.dispatch(StoreAuthStep(step: AuthStep.linkingGitHub));
                await authService.signInWithGithub(action.token);
              }
            }
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

class RequestGitHubAuthMiddleware
    extends TypedMiddleware<AppState, RequestGitHubAuth> {
  RequestGitHubAuthMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(StoreAuthStep(step: AuthStep.requestingGitHubAuth));
          await platformService.redirectWithState(store.state.userData.uid);
        });
}

class SignOutMiddleware extends TypedMiddleware<AppState, SignOut> {
  SignOutMiddleware(AuthService authService, NavigationService navigatonService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              ProblemLocation.signOutMiddleware, store.dispatch);

          try {
            store.dispatch(StoreAuthStep(step: AuthStep.signingOut));
            await authService.signOut();
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
