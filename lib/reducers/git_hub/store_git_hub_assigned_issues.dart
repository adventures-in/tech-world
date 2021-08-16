import 'package:adventures_in_tech_world/actions/git_hub/store_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreGitHubAssignedIssuesReducer
    extends TypedReducer<AppState, StoreGitHubAssignedIssues> {
  StoreGitHubAssignedIssuesReducer()
      : super((state, action) => state
            .rebuild((b) => b..gitHubAssignedIssues.replace(action.issues)));
}
