import 'package:flutter/widgets.dart';

import '../redux/state/math/double2.dart';

extension OffsetsListExtension on List<Offset> {
  List<Double2> toValues() =>
      map<Double2>((offset) => Double2(offset.dx, offset.dy)).toList();
}
