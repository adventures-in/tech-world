import 'package:flame/extensions.dart';

extension OffsetExtension on Offset {
  Vector2 toUnit() {
    final o = this / 64;
    return Vector2(o.dx.floorToDouble(), o.dy.floorToDouble());
  }

  Rect toRect64() =>
      Rect.fromPoints((this * 64), ((this + const Offset(1, 1)) * 64));
}
