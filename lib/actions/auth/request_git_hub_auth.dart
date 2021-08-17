import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'request_git_hub_auth.freezed.dart';
part 'request_git_hub_auth.g.dart';

@freezed
class RequestGitHubAuth with _$RequestGitHubAuth, ReduxAction {
  factory RequestGitHubAuth() = _RequestGitHubAuth;

  factory RequestGitHubAuth.fromJson(Map<String, Object?> json) =>
      _$RequestGitHubAuthFromJson(json);
}
