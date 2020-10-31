import 'package:adventures_in_tech_world/middleware/auth/connect_auth_state.dart';
import 'package:adventures_in_tech_world/middleware/auth/plumb_services.dart';
import 'package:adventures_in_tech_world/middleware/auth/request_git_hub_auth.dart.dart';
import 'package:adventures_in_tech_world/middleware/auth/sign_out.dart';
import 'package:adventures_in_tech_world/middleware/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/middleware/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/middleware/git_hub/retrieve_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/middleware/git_hub/retrieve_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/middleware/git_hub/retrieve_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
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
}) {
  return [
    // Auth
    PlumbServicesMiddleware(authService, databaseService),
    ConnectAuthStateMiddleware(authService),
    StoreUserDataMiddleware(authService, databaseService),
    RequestGitHubAuthMiddleware(platformService),
    StoreGitHubTokenMiddleware(authService, databaseService, gitHubService),
    SignOutMiddleware(authService, gitHubService),
    // GitHub
    RetrieveGitHubRepositoriesMiddleware(gitHubService),
    RetrieveGitHubAssignedIssuesMiddleware(gitHubService),
    RetrieveGitHubPullRequestsMiddleware(gitHubService),
  ];
}
