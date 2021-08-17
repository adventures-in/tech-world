import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/models/git_hub/git_hub_user.dart';

part 'git_hub_pull_request.freezed.dart';
part 'git_hub_pull_request.g.dart';

@freezed
class GitHubPullRequest with _$GitHubPullRequest, ReduxModel {
  factory GitHubPullRequest({
    required GitHubUser repositoryOwner,
    required GitHubUser author,
    required int number,
    required String url,
    required String title,
    required DateTime updatedAt,
    required dynamic state, // PullRequestState
    required bool isDraft,
    required int comments,
    required int files,
  }) = _GitHubPullRequest;

  factory GitHubPullRequest.fromJson(Map<String, Object?> json) =>
      _$GitHubPullRequestFromJson(json);
}
