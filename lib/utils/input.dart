import 'package:flutter/services.dart';
import 'package:tech_world/shared/direction_enum.dart';

Map<int, DirectionEnum> directionFor = {
  68719477508: DirectionEnum.up,
  68719477505: DirectionEnum.down,
  68719477506: DirectionEnum.left,
  68719477507: DirectionEnum.right,
};

class Input {
  static DirectionEnum? directionFrom(RawKeyEvent event) =>
      directionFor[event.data.logicalKey.keyId];
}
