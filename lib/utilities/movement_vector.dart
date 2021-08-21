import 'package:flame/extensions.dart';
import 'package:tech_world/enums/direction.dart';
import 'package:tech_world/utilities/constants.dart';

class MovementVector {
  static Vector2 get up => Vector2(0, -squareSize);
  static Vector2 get down => Vector2(0, squareSize);
  static Vector2 get left => Vector2(-squareSize, 0);
  static Vector2 get right => Vector2(squareSize, 0);

  static final _map = <Direction, Vector2>{
    Direction.up: MovementVector.up,
    Direction.down: MovementVector.down,
    Direction.left: MovementVector.left,
    Direction.right: MovementVector.right
  };

  static Vector2 toward(Direction direction) =>
      _map[direction] ?? Vector2(0, 0);
}
