import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';

class RetrieveGitHubAssignedIssuesMiddleware
    extends TypedMiddleware<AppState, RetrieveGitHubAssignedIssues> {
  RetrieveGitHubAssignedIssuesMiddleware(GitHubService gitHubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'RetrieveGitHubAssignedIssuesMiddleware');

          try {
            final issues = await gitHubService.retrieveAssignedIssues();
            store
                .dispatch(StoreGitHubAssignedIssues(issues: BuiltList(issues)));
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
