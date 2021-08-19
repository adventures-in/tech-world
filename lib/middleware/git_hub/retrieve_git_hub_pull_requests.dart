import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/retrieve_git_hub_pull_requests.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_pull_requests.dart';
import 'package:tech_world/utils/locator.dart';

import '../../main.dart';

class RetrieveGitHubPullRequestsMiddleware
    extends TypedMiddleware<AppState, RetrieveGitHubPullRequests> {
  RetrieveGitHubPullRequestsMiddleware()
      : super((store, action, next) async {
          next(action);

          final gitHubService = Locator.getGitHubService();

          try {
            final prs = await gitHubService.retrievePullRequests();
            store.dispatch(StoreGitHubPullRequests(IList(prs)));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
