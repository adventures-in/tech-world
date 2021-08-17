import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'retrieve_git_hub_repositories.freezed.dart';
part 'retrieve_git_hub_repositories.g.dart';

@freezed
class RetrieveGitHubRepositories
    with _$RetrieveGitHubRepositories, ReduxAction {
  factory RetrieveGitHubRepositories() = _RetrieveGitHubRepositories;

  factory RetrieveGitHubRepositories.fromJson(Map<String, Object?> json) =>
      _$RetrieveGitHubRepositoriesFromJson(json);
}
