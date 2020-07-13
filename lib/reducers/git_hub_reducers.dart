import 'package:adventures_in_tech_world/actions/github/store_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final gitHubReducers = <AppState Function(AppState, dynamic)>[
  StoreGitHubRepositoriesReducer(),
  StoreGitHubAssignedIssuesReducer(),
  StoreGitHubPullRequestsReducer(),
];

class StoreGitHubRepositoriesReducer
    extends TypedReducer<AppState, StoreGitHubRepositories> {
  StoreGitHubRepositoriesReducer()
      : super((state, action) => state.rebuild(
            (b) => b..gitHubRepositories.replace(action.repositories)));
}

class StoreGitHubAssignedIssuesReducer
    extends TypedReducer<AppState, StoreGitHubAssignedIssues> {
  StoreGitHubAssignedIssuesReducer()
      : super((state, action) => state
            .rebuild((b) => b..gitHubAssignedIssues.replace(action.issues)));
}

class StoreGitHubPullRequestsReducer
    extends TypedReducer<AppState, StoreGitHubPullRequests> {
  StoreGitHubPullRequestsReducer()
      : super((state, action) =>
            state.rebuild((b) => b..gitHubPullRequests.replace(action.prs)));
}
