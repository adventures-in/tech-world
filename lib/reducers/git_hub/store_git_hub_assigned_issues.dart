import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_assigned_issues.dart';

import '../../main.dart';

class StoreGitHubAssignedIssuesReducer
    extends TypedReducer<AppState, StoreGitHubAssignedIssues> {
  StoreGitHubAssignedIssuesReducer()
      : super((state, action) =>
            state.copyWith(gitHubAssignedIssues: action.issues));
}
