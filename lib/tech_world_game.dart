import 'package:a_star_algorithm/a_star_algorithm.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:tech_world/drawing/player_component.dart';
import 'package:tech_world/main.dart';
import 'package:tech_world/redux/services/locator.dart';

import 'drawing/map_components.dart';
import 'extensions/offset_extension.dart';
import 'extensions/vector2_extension.dart';

bool _paused = false;
var _clickedUnit = Vector2(0, 0);
List<Offset> _pathLocations = [];
final _playersService = Locator.playersService;
final _networkingService = Locator.networkingService;
late final PlayerComponent _player1;

int departureTime = 0;

class TechWorldGame extends Game with KeyboardEvents, TapDetector {
  TechWorldGame({required this.appStateChanges});

  Stream<AppState> appStateChanges;

  // final GameState _gameState;
  final MapComponents _mapComponents = MapComponents();

  @override
  Future<void> onLoad() async {
    _player1 = await _playersService.createPlayer1Avatar();
  }

  @override
  void onKeyEvent(RawKeyEvent event) {
    print(event.data);

    if (event.isShiftPressed) return _togglePausedState();

    // otherwise we change the direction of movement
    // _character.changeDirection(keyEvent);
  }

  void _togglePausedState() =>
      (_paused = !_paused) ? pauseEngine() : resumeEngine();

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);

    final point = info.eventPosition.game.toOffset();
    _clickedUnit = point.toUnit();

    _pathLocations = AStar(
      rows: 10,
      columns: 10,
      start: _clickedUnit.toOffset(),
      end: _player1.position.inUnits.toOffset(),
      barriers: _mapComponents.barrierOffsets,
    ).findThePath()
      ..add(_clickedUnit.toOffset());

    final bigPathLocations =
        _pathLocations.map((offset) => (offset).toVector2() * 64).toList();

    departureTime = DateTime.now().millisecondsSinceEpoch;
    _networkingService.publishPath(_pathLocations);

    _player1.move(speed: 300, points: bigPathLocations);
  }

  @override
  Color backgroundColor() => const Color(0xFF222222);

  @override
  void update(double dt) {
    _playersService.update(dt);
  }

  // remember - order matters!
  @override
  void render(Canvas canvas) {
    // Draw the grid.
    _mapComponents.render(canvas);

    // draw the path squares
    for (final location in _pathLocations) {
      canvas.drawRect(location.toRect64(), Paint()..color = Colors.blue);
    }

    // Draw the selected square.
    canvas.drawRect(
        _clickedUnit.toRect64(), Paint()..color = Colors.lightGreen);

    _playersService.render(canvas);
  }
}
