import 'package:adventures_in/actions/auth/auth_with_git_hub.dart';
import 'package:adventures_in/actions/auth/check_auth_state.dart';
import 'package:adventures_in/actions/auth/deal_with_auth_code.dart';
import 'package:adventures_in/actions/auth/sign_out.dart';
import 'package:adventures_in/models/app/app_state.dart';
import 'package:adventures_in/services/auth_service.dart';
import 'package:adventures_in/services/platform_service.dart';
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
    CheckAuthStateMiddleware(authService),
    AuthWithGitHubMiddleware(platformService, authService),
    SignOutMiddleware(authService),
    DealWithAuthCodeMiddleware(authService),
  ];
}

class CheckAuthStateMiddleware
    extends TypedMiddleware<AppState, CheckAuthState> {
  CheckAuthStateMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // check the auth state and dispatch the resulting action
          final reaction = await authService.checkAuthState();
          store.dispatch(reaction);
        });
}

class AuthWithGitHubMiddleware
    extends TypedMiddleware<AppState, AuthWithGitHub> {
  AuthWithGitHubMiddleware(
      PlatformService platformService, AuthService authService)
      : super((store, action, next) async {
          next(action);

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

// DealWithAuthCodeMiddleware _dealWithAuthCode(AuthService authService) =>
//     (store, action, next) async {
//       next(action);

//       final reaction = await authService.exchangeCodeForToken(action.code);
//       store.dispatch(reaction);
//     };

// class DealWithAuthCodeMiddleware implements MiddlewareClass<AppState> {
//   DealWithAuthCodeMiddleware(this.authService);

//   AuthService authService;

//   dynamic _middleware(Store<AppState> store, DealWithAuthCode action,
//       NextDispatcher next) async {
//     next(action);

//     final reaction = await authService.exchangeCodeForToken(action.code);
//     store.dispatch(reaction);
//   }

//   @override
//   dynamic call(Store<AppState> store, dynamic action, NextDispatcher next) =>
//       (action is DealWithAuthCode)
//           ? _middleware(store, action, next)
//           : next(action);
// }

class DealWithAuthCodeMiddleware
    extends TypedMiddleware<AppState, DealWithAuthCode> {
  DealWithAuthCodeMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // if there is no auth code in the parameters, just return
          if (action.queryParameters['code'] == null) return;

          final reaction =
              await authService.exchangeCodeForToken(action.queryParameters);
          store.dispatch(reaction);
        });
}
