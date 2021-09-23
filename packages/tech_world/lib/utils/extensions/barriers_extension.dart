import 'package:flutter/painting.dart';
import 'package:tech_world/game/background/barriers.dart';

extension BarriersExtension on Barriers {
  List<Offset> toOffsets() => positions
      .map<Offset>(
          (position) => Offset(position.x.toDouble(), position.y.toDouble()))
      .toList();
}
