import 'package:adventures_in_tech_world/actions/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/actions/auth/auth_with_git_hub.dart';
import 'package:adventures_in_tech_world/actions/auth/check_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/deal_with_auth_code.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_token.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth_service.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
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
    {AuthService authService, PlatformService platformService}) {
  return [
    DealWithAuthCodeMiddleware(authService),
    CheckAuthStateMiddleware(authService, platformService),
    AuthWithGitHubMiddleware(platformService, authService),
    SignOutMiddleware(authService),
  ];
}

class DealWithAuthCodeMiddleware
    extends TypedMiddleware<AppState, DealWithAuthCode> {
  DealWithAuthCodeMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // if there is no auth code in the parameters, we just carry on and
          // the regular auth check will go about it's business
          if (action.queryParameters['code'] == null) return;

          authService
              .exchangeCodeForToken(action.queryParameters)
              .listen(store.dispatch);
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
            store.dispatch(StoreAuthState(state: AuthState.notSignedIn));
            store.dispatch(StoreAuthStep(step: AuthStep.waitingForInput));
          } else {
            store.dispatch(StoreAuthToken(token: token));
            final adventurer = await authService.signInWithFirebase(token);
            store.dispatch(StoreAdventurer(adventurer: adventurer));
            store.dispatch(StoreAuthState(state: AuthState.signedIn));
          }
        });
}

class AuthWithGitHubMiddleware
    extends TypedMiddleware<AppState, AuthWithGitHub> {
  AuthWithGitHubMiddleware(
      PlatformService platformService, AuthService authService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(StoreAuthStep(step: AuthStep.signingIn));

          await platformService.redirect(authService.githubRedirectUri);
        });
}

class SignOutMiddleware extends TypedMiddleware<AppState, SignOut> {
  SignOutMiddleware(AuthService service)
      : super((store, action, next) async {
          next(action);

          // sign out and dispatch the resulting problem if there is one
          final actionAfterSignout = await service.signOut();

          if (actionAfterSignout != null) {
            store.dispatch(actionAfterSignout);
          }
        });
}
