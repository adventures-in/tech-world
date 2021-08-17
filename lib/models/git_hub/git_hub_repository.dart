import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/models/git_hub/git_hub_user.dart';

part 'git_hub_repository.freezed.dart';
part 'git_hub_repository.g.dart';

@freezed
class GitHubRepository with _$GitHubRepository, ReduxModel {
  factory GitHubRepository({
    required String name,
    String? description,
    required bool isFork,
    required bool isPrivate,
    required int stargazers,
    required String url,
    required int issues,
    required GitHubUser owner,
  }) = _GitHubRepository;

  factory GitHubRepository.fromJson(Map<String, Object?> json) =>
      _$GitHubRepositoryFromJson(json);
}
