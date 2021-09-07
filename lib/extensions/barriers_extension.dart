import 'package:flutter/painting.dart';

import '../redux/state/game/barriers.dart';

extension BarriersExtension on Barriers {
  List<Offset> toOffsets() => positions
      .map<Offset>(
          (position) => Offset(position.x.toDouble(), position.y.toDouble()))
      .toList();
}
