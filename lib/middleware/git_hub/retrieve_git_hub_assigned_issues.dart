import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/retrieve_git_hub_assigned_issues.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_assigned_issues.dart';

import '../../main.dart';

class RetrieveGitHubAssignedIssuesMiddleware
    extends TypedMiddleware<AppState, RetrieveGitHubAssignedIssues> {
  RetrieveGitHubAssignedIssuesMiddleware()
      : super((store, action, next) async {
          next(action);

          final gitHubService = Locator.getGitHubService();

          try {
            final issues = await gitHubService.retrieveAssignedIssues();
            store.dispatch(StoreGitHubAssignedIssues(issues));
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
