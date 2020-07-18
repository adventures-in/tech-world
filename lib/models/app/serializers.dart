import 'package:adventures_in_tech_world/actions/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/actions/app/plumb_services.dart';
import 'package:adventures_in_tech_world/actions/auth/connect_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_in_anonymously.dart';
import 'package:adventures_in_tech_world/actions/auth/request_git_hub_auth.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/actions/navigation/launch_url.dart';
import 'package:adventures_in_tech_world/actions/navigation/navigate_to_profile.dart';
import 'package:adventures_in_tech_world/actions/navigation/store_nav_selection.dart';
import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/display_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/remove_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/store_displaying_problem.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/github/pull_request_state.dart';
import 'package:adventures_in_tech_world/enums/nav_selection.dart';
import 'package:adventures_in_tech_world/enums/problem_location.dart';
import 'package:adventures_in_tech_world/enums/themes/brightness_mode.dart';
import 'package:adventures_in_tech_world/enums/themes/theme_brightness.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/app/settings.dart';
import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_issue.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_label.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_pull_request.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_user.dart';
import 'package:adventures_in_tech_world/models/problems/problem.dart';
import 'package:adventures_in_tech_world/models/themes/theme_colors.dart';
import 'package:adventures_in_tech_world/models/themes/theme_set.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

/// Once per app, define a top level "Serializer" to gather together
/// all the generated serializers.
///
/// Collection of generated serializers for the AdventuresIn app
@SerializersFor([
  AddProblem,
  AppState,
  AuthProviderData,
  ConnectAuthState,
  DisplayProblem,
  GitHubIssue,
  GitHubLabel,
  GitHubPullRequest,
  GitHubRepository,
  GitHubUser,
  LaunchURL,
  NavigateToProfile,
  PlumbServices,
  PullRequestState,
  RequestGitHubAuth,
  RemoveProblem,
  RetrieveGitHubAssignedIssues,
  RetrieveGitHubPullRequests,
  RetrieveGitHubRepositories,
  SignInAnonymously,
  SignOut,
  StoreAdventurer,
  StoreAuthState,
  StoreAuthStep,
  StoreDisplayingProblem,
  StoreGitHubAssignedIssues,
  StoreGitHubPullRequests,
  StoreGitHubRepositories,
  StoreGitHubToken,
  StoreNavSelection,
  StoreUserData,
  UserData,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
