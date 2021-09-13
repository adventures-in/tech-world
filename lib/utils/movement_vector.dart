import 'package:flame/extensions.dart';
import 'package:tech_world/shared/constants.dart' as constants;
import 'package:tech_world/shared/direction_enum.dart';

const _sqSize = constants.squareSize;

class MovementVector {
  static Vector2 get up => Vector2(0, -_sqSize);
  static Vector2 get down => Vector2(0, _sqSize);
  static Vector2 get left => Vector2(-_sqSize, 0);
  static Vector2 get right => Vector2(_sqSize, 0);

  static final _map = <DirectionEnum, Vector2>{
    DirectionEnum.up: MovementVector.up,
    DirectionEnum.down: MovementVector.down,
    DirectionEnum.left: MovementVector.left,
    DirectionEnum.right: MovementVector.right
  };

  static Vector2 toward(DirectionEnum direction) =>
      _map[direction] ?? Vector2(0, 0);
}
