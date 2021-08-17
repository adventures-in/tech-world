import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/models/git_hub/git_hub_label.dart';
import 'package:tech_world/models/git_hub/git_hub_user.dart';

part 'git_hub_issue.freezed.dart';
part 'git_hub_issue.g.dart';

@freezed
class GitHubIssue with _$GitHubIssue, ReduxAction {
  factory GitHubIssue({
    required GitHubUser repoOwner,
    required int number,
    required String url,
    required String title,
    required GitHubUser author,
    required IList<GitHubLabel> labels,
    required int comments,
  }) = _GitHubIssue;

  factory GitHubIssue.fromJson(Map<String, Object?> json) =>
      _$GitHubIssueFromJson(json);
}
