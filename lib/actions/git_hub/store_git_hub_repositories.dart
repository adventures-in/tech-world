import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/models/git_hub/git_hub_pull_request.dart';
import 'package:tech_world/models/git_hub/git_hub_repository.dart';

part 'store_git_hub_repositories.freezed.dart';
part 'store_git_hub_repositories.g.dart';

@freezed
class StoreGitHubRepositories with _$StoreGitHubRepositories, ReduxAction {
  factory StoreGitHubRepositories(IList<GitHubRepository> repositories) =
      _StoreGitHubRepositories;

  factory StoreGitHubRepositories.fromJson(Map<String, Object?> json) =>
      _$StoreGitHubRepositoriesFromJson(json);
}
