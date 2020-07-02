import 'package:adventures_in/middleware/auth_middleware.dart';
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
List<Middleware<AppState>> createAppMiddleware(
    {AuthService authService, PlatformService platformService}) {
  return [
    ...createAuthMiddleware(
        authService: authService, platformService: platformService),
  ];
}
