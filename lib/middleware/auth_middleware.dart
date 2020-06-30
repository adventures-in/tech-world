import 'package:adventures_in/actions/auth/check_auth_state.dart';
import 'package:adventures_in/actions/auth/sign_out.dart';
import 'package:adventures_in/models/app/app_state.dart';
import 'package:adventures_in/services/auth_service.dart';
import 'package:redux/redux.dart';

typedef CheckAuthStateMiddleware = void Function(
    Store<AppState> store, CheckAuthState action, NextDispatcher next);
typedef SignOutMiddleware = void Function(
    Store<AppState> store, SignOut action, NextDispatcher next);

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createAuthMiddleware({AuthService authService}) {
  return [
    TypedMiddleware<AppState, CheckAuthState>(
      _checkAuthState(authService),
    ),
    TypedMiddleware<AppState, SignOut>(
      _signOutUser(authService),
    ),
  ];
}

CheckAuthStateMiddleware _checkAuthState(AuthService authService) =>
    (store, action, next) async {
      next(action);

      final reaction = await authService.checkAuthState();
      store.dispatch(reaction);
    };

SignOutMiddleware _signOutUser(AuthService authService) =>
    (store, action, next) async {
      next(action);

      // sign out and dispatch the resulting problem if there is one
      final actionAfterSignout = await authService.signOut();

      if (actionAfterSignout != null) {
        store.dispatch(actionAfterSignout);
      }
    };
