import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/retrieve_git_hub_assigned_issues.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_assigned_issues.dart';
import 'package:tech_world/utils/locator.dart';

import '../../main.dart';

class RetrieveGitHubAssignedIssuesMiddleware
    extends TypedMiddleware<AppState, RetrieveGitHubAssignedIssues> {
  RetrieveGitHubAssignedIssuesMiddleware()
      : super((store, action, next) async {
          next(action);

          final gitHubService = Locator.getGitHubService();

          try {
            final issues = await gitHubService.retrieveAssignedIssues();
            store.dispatch(StoreGitHubAssignedIssues(IList(issues)));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
