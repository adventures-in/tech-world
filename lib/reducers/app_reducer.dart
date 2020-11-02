import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/reducers/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/reducers/auth/sign_out.dart';
import 'package:adventures_in_tech_world/reducers/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/reducers/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/reducers/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/reducers/git_hub/store_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/reducers/git_hub/store_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/reducers/git_hub/store_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/reducers/navigation/push_page.dart';
import 'package:adventures_in_tech_world/reducers/navigation/remove_current_page.dart';
import 'package:adventures_in_tech_world/reducers/navigation/store_nav_bar_selection.dart';
import 'package:adventures_in_tech_world/reducers/problems/add_problem.dart';
import 'package:adventures_in_tech_world/reducers/problems/display_problem.dart';
import 'package:adventures_in_tech_world/reducers/problems/remove_problem.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer =
    combineReducers<AppState>(<AppState Function(AppState, dynamic)>[
  // Adventurers
  StoreAdventurerReducer(),
  // Auth
  StoreUserDataReducer(),
  StoreAuthStepReducer(),
  StoreGitHubTokenReducer(),
  SignOutReducer(),
  // GitHub
  StoreGitHubRepositoriesReducer(),
  StoreGitHubAssignedIssuesReducer(),
  StoreGitHubPullRequestsReducer(),
  // Navigation
  PushPageReducer(),
  RemoveCurrentPageReducer(),
  StoreNavBarSelectionReducer(),
  // Problems
  DisplayProblemReducer(),
  AddProblemReducer(),
  RemoveProblemReducer(),
]);
