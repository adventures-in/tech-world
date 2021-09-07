import 'package:a_star_algorithm/a_star_algorithm.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:tech_world/drawing/character_component.dart';
import 'package:tech_world/services/locator.dart';

import 'drawing/map_components.dart';
import 'extensions/offset_extension.dart';
import 'extensions/vector2_extension.dart';

bool _paused = false;
var _clickedUnit = Vector2(0, 0);
List<Offset> _pathUnits = [];
final _playersService = Locator.getPlayersService();
final _networkingService = Locator.getNetworkingService();
late final CharacterComponent _player1;

int departureTime = 0;

class TechWorldGame extends Game with KeyboardEvents, TapDetector {
  // TechWorldGame(this._gameState);

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

    _pathUnits = AStar(
      rows: 10,
      columns: 10,
      start: _clickedUnit.toOffset(),
      end: _player1.position.inUnits.toOffset(),
      barriers: _mapComponents.barrierOffsets,
    ).findThePath()
      ..add(_clickedUnit.toOffset());

    final pathVectors =
        _pathUnits.map((offset) => (offset).toVector2() * 64).toList();

    departureTime = DateTime.now().millisecondsSinceEpoch;
    _networkingService.publishPath(_pathUnits);

    _player1.move(speed: 300, points: pathVectors);
  }

  @override
  Color backgroundColor() => const Color(0xFF222222);

  @override
  void update(double dt) {
    _playersService.update(dt);
  }

  @override
  void render(Canvas canvas) {
    // Draw the grid.
    _mapComponents.render(canvas);

    for (final pathUnit in _pathUnits) {
      canvas.drawRect(pathUnit.toRect64(), Paint()..color = Colors.blue);
    }

    // Draw the selected square.
    canvas.drawRect(
        _clickedUnit.toRect64(), Paint()..color = Colors.lightGreen);

    _playersService.render(canvas);
  }
}
