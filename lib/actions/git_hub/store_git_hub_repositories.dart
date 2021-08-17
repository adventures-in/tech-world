import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'store_git_hub_repositories.freezed.dart';
part 'store_git_hub_repositories.g.dart';

@freezed
class StoreGitHubRepositories with _$StoreGitHubRepositories, ReduxAction {
  factory StoreGitHubRepositories() = _StoreGitHubRepositories;

  factory StoreGitHubRepositories.fromJson(Map<String, Object?> json) =>
      _$StoreGitHubRepositoriesFromJson(json);
}
