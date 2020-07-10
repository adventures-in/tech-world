import 'package:adventures_in_tech_world/actions/app/plumb_services.dart';
import 'package:adventures_in_tech_world/actions/auth/connect_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/observe_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/auth/request_git_hub_auth.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/problem_type.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
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
  DatabaseService databaseService,
  PlatformService platformService,
}) {
  return [
    PlumbServicesMiddleware(authService, databaseService),
    ConnectAuthStateMiddleware(authService),
    StoreUserDataMiddleware(authService, databaseService),
    ObserveGitHubTokenMiddleware(databaseService),
    RequestGitHubAuthMiddleware(platformService),
    StoreGitHubTokenMiddleware(authService),
    SignOutMiddleware(authService),
  ];
}

class PlumbServicesMiddleware extends TypedMiddleware<AppState, PlumbServices> {
  PlumbServicesMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              ProblemType.plumbServicesMiddleware, store.dispatch);

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
  StoreUserDataMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              ProblemType.storeUserDataMiddleware, store.dispatch);

          try {
            if (action.userData == null || action.userData.uid == null) {
              store
                  .dispatch(StoreAuthStep(step: AuthStep.signingInAnonymously));
              await authService.signInAnonymously();
            } else if (action.userData.isAnonymous) {
              store.dispatch(
                  StoreAuthStep(step: AuthStep.checkingForGitHubToken));
              databaseService.connectTokensDoc(uid: action.userData.uid);
            } else {
              store.dispatch(
                  StoreAuthState(state: AuthState.signedInWithGitHub));
            }
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

/// Observe the auth token in the [Database] and update the [AppState] to
/// reflect changes
class ObserveGitHubTokenMiddleware
    extends TypedMiddleware<AppState, ObserveGitHubToken> {
  ObserveGitHubTokenMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          databaseService.connectTokensDoc(uid: action.uid);
        });
}

class StoreGitHubTokenMiddleware
    extends TypedMiddleware<AppState, StoreGitHubToken> {
  StoreGitHubTokenMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              ProblemType.storeGitHubTokenMiddleware, store.dispatch);

          try {
            // If we got a token and aren't already signed in with github do so
            if (action.token != null && !store.state.userData.hasGitHub) {
              store.dispatch(StoreAuthStep(step: AuthStep.linkingGitHub));
              await authService.signInWithGithub(action.token);
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
  SignOutMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              ProblemType.signOutMiddleware, store.dispatch);

          try {
            await authService.signOut();
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
