import 'package:adventures_in_tech_world/actions/git_hub/retrieve_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/actions/git_hub/store_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';

class RetrieveGitHubPullRequestsMiddleware
    extends TypedMiddleware<AppState, RetrieveGitHubPullRequests> {
  RetrieveGitHubPullRequestsMiddleware(GitHubService githubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'RetrieveGitHubPullRequestsMiddleware');

          try {
            final prs = await githubService.retrievePullRequests();
            store.dispatch(StoreGitHubPullRequests(prs: BuiltList(prs)));
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
