import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_pull_requests.dart';
import 'package:tech_world/models/app/app_state.dart';

class StoreGitHubPullRequestsReducer
    extends TypedReducer<AppState, StoreGitHubPullRequests> {
  StoreGitHubPullRequestsReducer()
      : super((state, action) =>
            state.rebuild((b) => b..gitHubPullRequests.replace(action.prs)));
}
