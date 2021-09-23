import 'package:flame/extensions.dart';
import 'package:tech_world/shared/direction_enum.dart';

extension Vector2Extension on Vector2 {
  Vector2 get inUnits => (this / 64)..floor();
  Rect toRect64() => Rect.fromPoints(
      (this * 64).toOffset(), ((this + Vector2(1, 1)) * 64).toOffset());
  DirectionEnum toDirection() {
    if (x < 0) return DirectionEnum.left;
    if (x > 0) return DirectionEnum.right;
    if (y < 0) return DirectionEnum.up;
    return DirectionEnum.down;
  }
}
