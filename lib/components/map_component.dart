import 'package:a_star_algorithm/a_star_algorithm.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tech_world/redux/state/game/barriers.dart';
import 'package:tech_world/shared/constants.dart' as constants;
import 'package:tech_world/utils/extensions/barriers_extension.dart';
import 'package:tech_world/utils/extensions/offset_extension.dart';
import 'package:tech_world/utils/extensions/vector2_extension.dart';

class MapComponent extends Component {
  MapComponent({Barriers? barriers}) : _barriers = barriers ?? Barriers() {
    _barrierOffsets = _barriers.toOffsets();
    // Convert the unit sized barriers to Rects of size 64
    _barrierRects = _barriers.positions
        .map((position) => Rect.fromPoints(
            Offset(position.x * constants.squareSize,
                position.y * constants.squareSize),
            Offset((position.x + 1) * constants.squareSize,
                (position.y + 1) * constants.squareSize)))
        .toList();
  }

  final Barriers _barriers;
  late List<Offset> _barrierOffsets;
  late List<Rect> _barrierRects;
  List<Offset> _pathLocations = [];

  final _linePaint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round;

  // Returns the path locations in 'big' space
  // The AStar function takes locations in 'unit space' and we are using a grid
  // of 64x64 squares ('big space').
  //
  // The AStar algorithm works backwards so starts at the 'end' ie the clicked
  // location.
  IList<Vector2> createPath({required Vector2 start, required Vector2 end}) {
    _pathLocations = AStar(
      rows: 10,
      columns: 10,
      start: end.inUnits.toOffset(),
      end: start.inUnits.toOffset(),
      barriers: _barrierOffsets,
    ).findThePath()
      ..insert(0, start.inUnits.toOffset())
      ..add(end.inUnits.toOffset()); //

    return _pathLocations
        .map<Vector2>((offset) => (offset).toVector2() * 64)
        .toIList();
  }

  @override
  void render(Canvas c) {
    super.render(c);

    // draw the path squares
    for (final pathLocation in _pathLocations) {
      c.drawRect(pathLocation.toRect64(), Paint()..color = Colors.blue);
    }

    //Draw the selected square.
    if (_pathLocations.isNotEmpty) {
      c.drawRect(
          _pathLocations.last.toRect64(), Paint()..color = Colors.lightGreen);
    }

    // draw the grid
    for (double i = 0; i <= constants.gridHeight; i += constants.squareSize) {
      c.drawLine(Offset(0, i), Offset(constants.gridWidth, i), _linePaint);
    }
    for (double i = 0; i <= constants.gridWidth; i += constants.squareSize) {
      c.drawLine(Offset(i, 0), Offset(i, constants.gridHeight), _linePaint);
    }

    // draw the barrier squares
    for (final barrierRect in _barrierRects) {
      c.drawRect(barrierRect, Paint()..color = Colors.red);
    }
  }
}
