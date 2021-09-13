import 'package:flame/extensions.dart';
import 'package:tech_world/shared/direction_enum.dart';
import 'package:tech_world/utils/movement_vector.dart';

extension DirectionExtension on DirectionEnum? {
  Vector2 get vector => MovementVector.toward(this ?? DirectionEnum.up);
}
