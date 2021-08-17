import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/models/git_hub/git_hub_issue.dart';

part 'store_git_hub_assigned_issues.freezed.dart';
part 'store_git_hub_assigned_issues.g.dart';

@freezed
class StoreGitHubAssignedIssues with _$StoreGitHubAssignedIssues, ReduxAction {
  factory StoreGitHubAssignedIssues(IList<GitHubIssue> issues) =
      _StoreGitHubAssignedIssues;

  factory StoreGitHubAssignedIssues.fromJson(Map<String, Object?> json) =>
      _$StoreGitHubAssignedIssuesFromJson(json);
}
