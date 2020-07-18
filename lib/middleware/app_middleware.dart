import 'package:adventures_in_tech_world/middleware/auth_middleware.dart';
import 'package:adventures_in_tech_world/middleware/git_hub_middleware.dart';
import 'package:adventures_in_tech_world/middleware/navigation_middleware.dart';
import 'package:adventures_in_tech_world/middleware/problems_middleware.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/services/navigation_service.dart';
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
List<Middleware<AppState>> createAppMiddleware({
  AuthService authService,
  GitHubService gitHubService,
  DatabaseService databaseService,
  PlatformService platformService,
  NavigationService navigationService,
}) {
  return [
    ...createAuthMiddleware(
      authService: authService,
      navigationService: navigationService,
      gitHubService: gitHubService,
      databaseService: databaseService,
      platformService: platformService,
    ),
    ...createProblemsMiddleware(navigationService: navigationService),
    ...createGitHubMiddleware(gitHubService: gitHubService),
    ...createNavigationMiddleware(
        navigationService: navigationService, platformService: platformService),
  ];
}
