import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'retrieve_git_hub_assigned_issues.freezed.dart';
part 'retrieve_git_hub_assigned_issues.g.dart';

@freezed
class RetrieveGitHubAssignedIssues
    with _$RetrieveGitHubAssignedIssues, ReduxAction {
  factory RetrieveGitHubAssignedIssues() = _RetrieveGitHubAssignedIssues;

  factory RetrieveGitHubAssignedIssues.fromJson(Map<String, Object?> json) =>
      _$RetrieveGitHubAssignedIssuesFromJson(json);
}
