import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../extensions/barriers_extension.dart';
import '../redux/state/game/barriers.dart';
import '../utilities/constants.dart';

class MapComponents {
  MapComponents({Barriers? barriers}) : _barriers = barriers ?? Barriers() {
    _barrierOffsets = _barriers.toOffsets();
    // Convert the unit sized barriers to Rects of size 64
    _barrierRects = _barriers.positions
        .map((position) => Rect.fromPoints(
            Offset(position.x * squareSize, position.y * squareSize),
            Offset(
                (position.x + 1) * squareSize, (position.y + 1) * squareSize)))
        .toList();
  }

  final Barriers _barriers;
  late List<Offset> _barrierOffsets;
  late List<Rect> _barrierRects;

  final _linePaint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round;

  List<Offset> get barrierOffsets => _barrierOffsets;
  List<Rect> get barrierRects => _barrierRects;

  void render(Canvas canvas) {
    for (double i = 0; i <= gridHeight; i += squareSize) {
      canvas.drawLine(Offset(0, i), Offset(gridWidth, i), _linePaint);
    }
    for (double i = 0; i <= gridWidth; i += squareSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, gridHeight), _linePaint);
    }

    for (final barrierRect in barrierRects) {
      canvas.drawRect(barrierRect, Paint()..color = Colors.red);
    }
  }
}
