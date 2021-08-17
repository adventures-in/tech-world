import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'git_hub_user.freezed.dart';
part 'git_hub_user.g.dart';

@freezed
class GitHubUser with _$GitHubUser, ReduxAction {
  factory GitHubUser({required String login, required String avatarUrl}) =
      _GitHubUser;

  factory GitHubUser.fromJson(Map<String, Object?> json) =>
      _$GitHubUserFromJson(json);
}
