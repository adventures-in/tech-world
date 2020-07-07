import 'package:adventures_in_tech_world/middleware/auth_middleware.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth_service.dart';
import 'package:adventures_in_tech_world/services/database_service.dart';
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
List<Middleware<AppState>> createAppMiddleware(
    {AuthService authService,
    DatabaseService databaseService,
    PlatformService platformService}) {
  return [
    ...createAuthMiddleware(
        authService: authService,
        databaseService: databaseService,
        platformService: platformService),
  ];
}
