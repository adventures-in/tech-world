import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';

import '../redux/state/math/double2.dart';

extension OffsetsListExtension on List<Offset> {
  IList<Double2> toValues() =>
      map<Double2>((offset) => Double2(offset.dx, offset.dy)).toIList();
}
