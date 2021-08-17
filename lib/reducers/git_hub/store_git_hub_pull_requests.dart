import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_pull_requests.dart';

import '../../main.dart';

class StoreGitHubPullRequestsReducer
    extends TypedReducer<AppState, StoreGitHubPullRequests> {
  StoreGitHubPullRequestsReducer()
      : super(
            (state, action) => state.copyWith(gitHubPullRequests: action.prs));
}
