import 'package:flame/extensions.dart';
import 'package:tech_world/enums/direction.dart';
import 'package:tech_world/utilities/movement_vector.dart';

extension DirectionExtension on Direction? {
  Vector2 get vector => MovementVector.toward(this ?? Direction.up);
}
