import 'package:tech_world/shared/direction_enum.dart';
import 'package:tech_world/utils/movement_vector.dart';
import 'package:vector_math/vector_math_64.dart';

extension DirectionExtension on DirectionEnum? {
  Vector2 get vector => MovementVector.toward(this ?? DirectionEnum.up);
}
