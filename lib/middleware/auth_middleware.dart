import 'package:adventures_in_tech_world/actions/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/actions/app/plumb_database_stream.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_in_anonymously.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_in_with_git_hub.dart';
import 'package:adventures_in_tech_world/actions/auth/check_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/actions/auth/store_anonymous_id.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_token.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/problem_type.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth_service.dart';
import 'package:adventures_in_tech_world/services/database_service.dart';
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
List<Middleware<AppState>> createAuthMiddleware(
    {AuthService authService,
    DatabaseService databaseService,
    PlatformService platformService}) {
  return [
    PlumbDatabaseStreamMiddleware(databaseService),
    CheckAuthStateMiddleware(authService, platformService),
    SignInAnonymouslyMiddleware(authService),
    ObserveAuthTokenMiddleware(databaseService),
    SignInWithGitHubMiddleware(platformService, authService),
    SignOutMiddleware(authService),
  ];
}

class PlumbDatabaseStreamMiddleware
    extends TypedMiddleware<AppState, PlumbDatabaseStream> {
  PlumbDatabaseStreamMiddleware(DatabaseService service)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              ProblemType.plumbDatabaseStreamMiddleware, store.dispatch);

          /// We don't manage the subscription as the stream is expected
          /// to stay open for the whole lifetime of the app
          try {
            service.storeStream.listen(store.dispatch, onError: handleProblem);
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

class CheckAuthStateMiddleware
    extends TypedMiddleware<AppState, CheckAuthState> {
  CheckAuthStateMiddleware(
      AuthService authService, PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          /// Check if the user is aready signed and set the auth state
          final token = await platformService.getStoredGitHubToken();
          if (token == null) {
            store.dispatch(StoreAuthStep(step: AuthStep.signingInAnonymously));
            store.dispatch(SignInAnonymously());
            store.dispatch(StoreAuthStep(step: AuthStep.waitingForInput));
          } else {
            store.dispatch(StoreAuthToken(token: token));
            final adventurer = await authService.signInWithFirebase(token);
            store.dispatch(StoreAdventurer(adventurer: adventurer));
            store.dispatch(
                StoreAuthState(state: AuthState.signedInWithFirebase));
          }
        });
}

class SignInAnonymouslyMiddleware
    extends TypedMiddleware<AppState, SignInAnonymously> {
  SignInAnonymouslyMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          final storeIdOrAddProblem = await authService.signInAnonymously();
          store.dispatch(storeIdOrAddProblem);

          // reset the UI
          store.dispatch(StoreAuthStep(step: AuthStep.waitingForInput));
        });
}

/// Observe the auth token in the [Database] and update the [AppState] to
/// reflect changes
class ObserveAuthTokenMiddleware
    extends TypedMiddleware<AppState, StoreAnonymousId> {
  ObserveAuthTokenMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          databaseService.observeAuthToken(uid: action.id);
        });
}

class SignInWithGitHubMiddleware
    extends TypedMiddleware<AppState, SignInWithGitHub> {
  SignInWithGitHubMiddleware(
      PlatformService platformService, AuthService authService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(StoreAuthStep(step: AuthStep.signingInWithGitHub));

          await platformService
              .redirect(authService.githubRedirectUri(store.state.anonymousId));
        });
}

class SignOutMiddleware extends TypedMiddleware<AppState, SignOut> {
  SignOutMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // sign out and dispatch the resulting problem if there is one
          final actionAfterSignout = await authService.signOut();

          if (actionAfterSignout != null) {
            store.dispatch(actionAfterSignout);
          }
        });
}
