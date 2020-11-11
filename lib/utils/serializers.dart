import 'package:adventures_in_tech_world/actions/adventurers/disregard_adventurer.dart';
import 'package:adventures_in_tech_world/actions/adventurers/observe_adventurer.dart';
import 'package:adventures_in_tech_world/actions/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/actions/adventurers/update_adventurer.dart';
import 'package:adventures_in_tech_world/actions/app/plumb_streams.dart';
import 'package:adventures_in_tech_world/actions/auth/observe_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/request_git_hub_auth.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_in_anonymously.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_in_with_apple.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_in_with_google.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_user_data.dart';
import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/actions/navigation/push_page.dart';
import 'package:adventures_in_tech_world/actions/navigation/remove_current_page.dart';
import 'package:adventures_in_tech_world/actions/navigation/store_nav_bar_selection.dart';
import 'package:adventures_in_tech_world/actions/platform/detect_platform.dart';
import 'package:adventures_in_tech_world/actions/platform/launch_url.dart';
import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/display_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/remove_problem.dart';
import 'package:adventures_in_tech_world/actions/profile/link_provider.dart';
import 'package:adventures_in_tech_world/actions/profile/request_authorization.dart';
import 'package:adventures_in_tech_world/actions/profile/update_profile.dart';
import 'package:adventures_in_tech_world/actions/settings/update_settings.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/auth/authorization_state.dart';
import 'package:adventures_in_tech_world/enums/auth/authorizing_step.dart';
import 'package:adventures_in_tech_world/enums/auth/linking_step.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/enums/github/pull_request_state.dart';
import 'package:adventures_in_tech_world/enums/nav_bar_selection.dart';
import 'package:adventures_in_tech_world/enums/platform/platform_enum.dart';
import 'package:adventures_in_tech_world/enums/settings/brightness_mode.dart';
import 'package:adventures_in_tech_world/enums/settings/theme_brightness.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:adventures_in_tech_world/models/auth/auth_user_data.dart';
import 'package:adventures_in_tech_world/models/auth/provider_state.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_issue.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_label.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_pull_request.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_user.dart';
import 'package:adventures_in_tech_world/models/navigation/initial_page_data.dart';
import 'package:adventures_in_tech_world/models/navigation/page_data.dart';
import 'package:adventures_in_tech_world/models/navigation/profile_page_data.dart';
import 'package:adventures_in_tech_world/models/problems/problem.dart';
import 'package:adventures_in_tech_world/models/profile/profile_v_m.dart';
import 'package:adventures_in_tech_world/models/settings/settings.dart';
import 'package:adventures_in_tech_world/models/settings/theme_colors.dart';
import 'package:adventures_in_tech_world/models/settings/theme_set.dart';
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
  Adventurer,
  AppState,
  AuthorizationState,
  AuthorizingStep,
  AuthProviderData,
  AuthStep,
  BrightnessMode,
  DetectPlatform,
  DisplayProblem,
  DisregardAdventurer,
  GitHubIssue,
  GitHubLabel,
  GitHubPullRequest,
  GitHubRepository,
  GitHubUser,
  InitialPageData,
  LaunchURL,
  LinkProvider,
  LinkingStep,
  NavBarSelection,
  ObserveAdventurer,
  ObserveAuthState,
  PageData,
  PlatformEnum,
  PlumbStreams,
  Problem,
  ProfilePageData,
  ProfileVM,
  Provider,
  ProviderState,
  PullRequestState,
  PushPage,
  RequestGitHubAuth,
  RemoveCurrentPage,
  RemoveProblem,
  RequestAuthorization,
  RetrieveGitHubAssignedIssues,
  RetrieveGitHubPullRequests,
  RetrieveGitHubRepositories,
  Settings,
  SignInAnonymously,
  SignInWithApple,
  SignInWithGoogle,
  SignOut,
  StoreAdventurer,
  StoreAuthStep,
  StoreGitHubAssignedIssues,
  StoreGitHubPullRequests,
  StoreGitHubRepositories,
  StoreGitHubToken,
  StoreNavBarSelection,
  StoreAuthUserData,
  ThemeBrightness,
  ThemeColors,
  ThemeSet,
  UpdateAdventurer,
  UpdateProfile,
  UpdateSettings,
  AuthUserData,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
