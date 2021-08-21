import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../../redux/state/game/movement_path.dart';

part 'store_movement_path_action.freezed.dart';
part 'store_movement_path_action.g.dart';

@freezed
class StoreMovementPathAction with _$StoreMovementPathAction, ReduxAction {
  factory StoreMovementPathAction(MovementPath data) = _StoreMovementPathAction;

  factory StoreMovementPathAction.fromJson(Map<String, Object?> json) =>
      _$StoreMovementPathActionFromJson(json);
}
