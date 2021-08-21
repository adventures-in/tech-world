import 'package:flame/extensions.dart';
import 'package:tech_world/enums/direction.dart';

extension Vector2Extension on Vector2 {
  Vector2 get inUnits => (this / 64)..floor();
  Rect toRect64() => Rect.fromPoints(
      (this * 64).toOffset(), ((this + Vector2(1, 1)) * 64).toOffset());
  Direction toDirection() {
    if (x < 0) return Direction.left;
    if (x > 0) return Direction.right;
    if (y < 0) return Direction.up;
    return Direction.down;
  }
}
