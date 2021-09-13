import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

part 'set_player_path_action.freezed.dart';
part 'set_player_path_action.g.dart';

@freezed
class SetPlayerPathAction with _$SetPlayerPathAction, ReduxAction {
  factory SetPlayerPathAction(PlayerPathMessage message) = _SetPlayerPathAction;

  factory SetPlayerPathAction.fromJson(Map<String, Object?> json) =>
      _$SetPlayerPathActionFromJson(json);
}
