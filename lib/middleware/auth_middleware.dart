import 'package:adventures_in_tech_world/actions/app/plumb_services.dart';
import 'package:adventures_in_tech_world/actions/auth/connect_auth_state_to_store.dart';
import 'package:adventures_in_tech_world/actions/auth/request_git_hub_auth.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
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
  GitHubService gitHubService,
  DatabaseService databaseService,
  PlatformService platformService,
}) {
  return [
    PlumbServicesMiddleware(authService, databaseService),
    ConnectAuthStateMiddleware(authService),
    StoreUserDataMiddleware(authService, databaseService),
    RequestGitHubAuthMiddleware(platformService),
    StoreGitHubTokenMiddleware(authService, databaseService, gitHubService),
    SignOutMiddleware(authService, gitHubService),
  ];
}

class PlumbServicesMiddleware extends TypedMiddleware<AppState, PlumbServices> {
  PlumbServicesMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'PlumbServicesMiddleware');

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
    extends TypedMiddleware<AppState, ConnectAuthStateToStore> {
  ConnectAuthStateMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'ConnectAuthStateMiddleware');

          try {
            authService.connectAuthStateToStore();
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

class StoreUserDataMiddleware extends TypedMiddleware<AppState, StoreUserData> {
  StoreUserDataMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'StoreUserDataMiddleware');

          try {
            if (action.userData == null) {
              // we are not signed in

              if (store.state.authStep == AuthStep.signingOut) {
                // user has just signed out so reset UI

                // TODO: popHome();
              }

              // sign in anonymously
              store
                  .dispatch(StoreAuthStep(step: AuthStep.signingInAnonymously));
              await authService.signInAnonymously();
            } else {
              // we are signed in

              if (store.state.gitHubToken == null) {
                // we have no token

                if (action.userData.hasGitHub) {
                  // we have signed in with github so retrieve the stored token
                  store.dispatch(
                      StoreAuthStep(step: AuthStep.retrievingStoredToken));
                  final token = await databaseService
                      .retrieveStoredToken(action.userData.uid);
                  store.dispatch(StoreGitHubToken(token: token));
                } else {
                  // connect to the database to see if there is a token there
                  store.dispatch(
                      StoreAuthStep(step: AuthStep.listeningForTempToken));
                  databaseService.connectTempTokenToStore(
                      uid: action.userData.uid);
                }
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

          final handleProblem = generateProblemHandler(
              store.dispatch, 'RequestGitHubAuthMiddleware');

          try {
            store.dispatch(StoreAuthStep(step: AuthStep.requestingGitHubAuth));
            await platformService.redirectWithState(store.state.userData.uid);
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

class StoreGitHubTokenMiddleware
    extends TypedMiddleware<AppState, StoreGitHubToken> {
  StoreGitHubTokenMiddleware(AuthService authService,
      DatabaseService databaseService, GitHubService gitHubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'StoreGitHubTokenMiddleware');

          try {
            if (action.token == null) {
              // there was no token

              // set the UI to let the user get a token
              store.dispatch(StoreAuthStep(step: AuthStep.waitingForInput));
            } else {
              // there was a token

              // put the token in the service
              gitHubService.token = action.token;

              // disconnect from the token section of the database
              databaseService.disconnectTempToken();

              if (!store.state.userData.hasGitHub) {
                // we have a token but haven't signed in with github

                // set anonymous account to be deleted
                final currentUserId = await authService.getCurrentUserId();
                await databaseService.deleteAnonymousAccount(currentUserId);

                // dispatch step change and sign in with github
                store.dispatch(
                    StoreAuthStep(step: AuthStep.signingInWithGitHub));
                final userData =
                    await authService.signInWithGithub(action.token);

                // we are now signed in with github so add the token and user
                // info to the user's db entry
                await databaseService.updateUserInfo(userData, action.token);
              }
            }
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

class SignOutMiddleware extends TypedMiddleware<AppState, SignOut> {
  SignOutMiddleware(AuthService authService, GitHubService gitHubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'SignOutMiddleware');

          try {
            // set the auth step and use the service to sign out
            store.dispatch(StoreAuthStep(step: AuthStep.signingOut));
            await authService.signOut();

            // delete the github token
            gitHubService.token = null;
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
