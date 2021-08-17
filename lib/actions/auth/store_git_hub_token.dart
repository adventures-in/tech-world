import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'store_git_hub_token.freezed.dart';
part 'store_git_hub_token.g.dart';

@freezed
class StoreGitHubToken with _$StoreGitHubToken, ReduxAction {
  factory StoreGitHubToken({String? token}) = _StoreGitHubToken;

  factory StoreGitHubToken.fromJson(Map<String, Object?> json) =>
      _$StoreGitHubTokenFromJson(json);

  @override
  String toString() {
    final tokenOutput =
        (token == null) ? 'null' : token!.substring(0, 4) + '...';
    return 'STORE_GIT_HUB_TOKEN: $tokenOutput';
  }
}
