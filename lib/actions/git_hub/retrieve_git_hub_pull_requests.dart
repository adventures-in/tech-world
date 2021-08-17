import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'retrieve_git_hub_pull_requests.freezed.dart';
part 'retrieve_git_hub_pull_requests.g.dart';

@freezed
class RetrieveGitHubPullRequests
    with _$RetrieveGitHubPullRequests, ReduxAction {
  factory RetrieveGitHubPullRequests() = _RetrieveGitHubPullRequests;

  factory RetrieveGitHubPullRequests.fromJson(Map<String, Object?> json) =>
      _$RetrieveGitHubPullRequestsFromJson(json);
}
