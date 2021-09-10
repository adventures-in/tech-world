import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/redux/state/game/movement_path.dart';

part 'set_movement_path_action.freezed.dart';
part 'set_movement_path_action.g.dart';

@freezed
class SetMovementPathAction with _$SetMovementPathAction, ReduxAction {
  factory SetMovementPathAction(MovementPath data) = _SetMovementPathAction;

  factory SetMovementPathAction.fromJson(Map<String, Object?> json) =>
      _$SetMovementPathActionFromJson(json);
}
