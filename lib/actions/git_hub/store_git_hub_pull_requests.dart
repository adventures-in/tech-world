import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/models/git_hub/git_hub_pull_request.dart';

part 'store_git_hub_pull_requests.freezed.dart';
part 'store_git_hub_pull_requests.g.dart';

@freezed
class StoreGitHubPullRequests with _$StoreGitHubPullRequests, ReduxAction {
  factory StoreGitHubPullRequests(IList<GitHubPullRequest> prs) =
      _StoreGitHubPullRequests;

  factory StoreGitHubPullRequests.fromJson(Map<String, Object?> json) =>
      _$StoreGitHubPullRequestsFromJson(json);
}
