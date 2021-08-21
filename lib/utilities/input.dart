import 'package:flutter/services.dart';

import '../enums/direction.dart';

Map<int, Direction> directionFor = {
  68719477508: Direction.up,
  68719477505: Direction.down,
  68719477506: Direction.left,
  68719477507: Direction.right,
};

class Input {
  static Direction? directionFrom(RawKeyEvent event) =>
      directionFor[event.data.logicalKey.keyId];
}
