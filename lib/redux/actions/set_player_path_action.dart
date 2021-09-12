import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/redux/state/game/player_path.dart';

part 'set_player_path_action.freezed.dart';
part 'set_player_path_action.g.dart';

@freezed
class SetPlayerPathAction with _$SetPlayerPathAction, ReduxAction {
  factory SetPlayerPathAction(PlayerPath data) = _SetPlayerPathAction;

  factory SetPlayerPathAction.fromJson(Map<String, Object?> json) =>
      _$SetPlayerPathActionFromJson(json);
}
