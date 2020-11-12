import 'package:adventures_in_tech_world/middleware/adventurers/disregard_adventurer.dart';
import 'package:adventures_in_tech_world/middleware/adventurers/observe_adventurer.dart';
import 'package:adventures_in_tech_world/middleware/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/middleware/app/plumb_streams.dart';
import 'package:adventures_in_tech_world/middleware/auth/observe_auth_state.dart';
import 'package:adventures_in_tech_world/middleware/auth/request_authorization.dart';
import 'package:adventures_in_tech_world/middleware/auth/request_git_hub_auth.dart';
import 'package:adventures_in_tech_world/middleware/auth/sign_in_with_apple.dart';
import 'package:adventures_in_tech_world/middleware/auth/sign_in_with_google.dart';
import 'package:adventures_in_tech_world/middleware/auth/sign_out.dart';
import 'package:adventures_in_tech_world/middleware/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/middleware/git_hub/retrieve_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/middleware/git_hub/retrieve_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/middleware/git_hub/retrieve_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/middleware/google/create_google_doc.dart';
import 'package:adventures_in_tech_world/middleware/platform/detect_platform.dart';
import 'package:adventures_in_tech_world/middleware/platform/launch_u_r_l.dart';
import 'package:adventures_in_tech_world/middleware/problems/add_problem.dart';
import 'package:adventures_in_tech_world/middleware/problems/display_problem.dart';
import 'package:adventures_in_tech_world/middleware/profile/link_provider.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth_service.dart';
import 'package:adventures_in_tech_world/services/database_service.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/services/google_service.dart';
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
  GoogleService googleService,
  DatabaseService databaseService,
  PlatformService platformService,
}) {
  return [
    // Adventurers
    StoreAdventurerMiddleware(googleService),
    // Auth
    ObserveAuthStateMiddleware(authService),
    PlumbStreamsMiddleware(authService, databaseService),
    RequestGitHubAuthMiddleware(platformService),
    StoreGitHubTokenMiddleware(authService, databaseService, gitHubService),
    SignInWithAppleMiddleware(authService),
    SignInWithGoogleMiddleware(authService, databaseService),
    SignOutMiddleware(authService, gitHubService),
    // GitHub
    RetrieveGitHubRepositoriesMiddleware(gitHubService),
    RetrieveGitHubAssignedIssuesMiddleware(gitHubService),
    RetrieveGitHubPullRequestsMiddleware(gitHubService),
    // Google
    CreateGoogleDocMiddleware(googleService),
    // Platform
    DetectPlatformMiddleware(platformService),
    LaunchURLMiddleware(platformService),
    // Problems
    AddProblemMiddleware(),
    DisplayProblemMiddleware(),
    // Profile
    DisregardAdventurerMiddleware(databaseService),
    LinkGoogleMiddleware(authService),
    ObserveAdventurerMiddleware(databaseService),
    RequestAuthorizationMiddleware(authService, databaseService),
  ];
}
