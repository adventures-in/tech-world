import 'package:adventures_in_tech_world/middleware/app/plumb_streams.dart';
import 'package:adventures_in_tech_world/middleware/auth/observe_auth_state.dart';
import 'package:adventures_in_tech_world/middleware/auth/request_git_hub_auth.dart';
import 'package:adventures_in_tech_world/middleware/auth/sign_in_with_apple.dart';
import 'package:adventures_in_tech_world/middleware/auth/sign_in_with_google.dart';
import 'package:adventures_in_tech_world/middleware/auth/sign_out.dart';
import 'package:adventures_in_tech_world/middleware/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/middleware/git_hub/retrieve_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/middleware/git_hub/retrieve_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/middleware/git_hub/retrieve_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/middleware/platform/launch_u_r_l.dart';
import 'package:adventures_in_tech_world/middleware/problems/add_problem.dart';
import 'package:adventures_in_tech_world/middleware/problems/display_problem.dart';
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
    ObserveAuthStateMiddleware(authService),
    PlumbStreamsMiddleware(authService, databaseService),
    RequestGitHubAuthMiddleware(platformService),
    StoreGitHubTokenMiddleware(authService, databaseService, gitHubService),
    SignInWithAppleMiddleware(authService),
    SignInWithGoogleMiddleware(authService),
    SignOutMiddleware(authService, gitHubService),
    // GitHub
    RetrieveGitHubRepositoriesMiddleware(gitHubService),
    RetrieveGitHubAssignedIssuesMiddleware(gitHubService),
    RetrieveGitHubPullRequestsMiddleware(gitHubService),
    // Platform
    LaunchURLMiddleware(platformService),
    // Problems
    AddProblemMiddleware(),
    DisplayProblemMiddleware(),
  ];
}
