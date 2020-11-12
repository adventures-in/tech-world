import 'package:adventures_in_tech_world/actions/git_hub/store_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreGitHubPullRequestsReducer
    extends TypedReducer<AppState, StoreGitHubPullRequests> {
  StoreGitHubPullRequestsReducer()
      : super((state, action) =>
            state.rebuild((b) => b..gitHubPullRequests.replace(action.prs)));
}
