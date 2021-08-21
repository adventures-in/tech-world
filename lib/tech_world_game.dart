import 'package:a_star_algorithm/a_star_algorithm.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:tech_world/services/locator.dart';

import 'drawing/character_component.dart';
import 'drawing/map_components.dart';
import 'extensions/offset_extension.dart';
import 'extensions/vector2_extension.dart';
import 'redux/state/game/game_state.dart';

CharacterComponent? _character;
Map<String, CharacterComponent> _players = {};
bool _paused = false;
var _clickedUnit = Vector2(0, 0);
List<Offset> _pathUnits = [];

int departureTime = 0;

class TechWorldGame extends Game with KeyboardEvents, TapDetector {
  TechWorldGame(this._gameState);

  final GameState _gameState;
  final MapComponents _mapComponents = MapComponents();

  @override
  Future<void> onLoad() async {
    // Create a character at the origin if none exists.
    _character ??=
        await CharacterComponent.create('bald.png', start: Position(0, 0));

    // Add a player for any new character that came through in the game state.
    for (final playerId in _gameState.presentIds) {
      if (!_players.containsKey(playerId)) {
        _players[playerId] =
            await CharacterComponent.create('bald.png', start: Position(9, 9));
      }
    }
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

    if (_character == null) return;

    final point = info.eventPosition.game.toOffset();
    _clickedUnit = point.toUnit();

    _pathUnits = AStar(
      rows: 10,
      columns: 10,
      start: _clickedUnit.toOffset(),
      end: _character!.position.inUnits.toOffset(),
      barriers: _mapComponents.barrierOffsets,
    ).findThePath()
      ..add(_clickedUnit.toOffset());

    final pathVectors =
        _pathUnits.map((offset) => (offset).toVector2() * 64).toList();

    final multiplayerService = MultiplayerLocator.getService();
    departureTime = DateTime.now().millisecondsSinceEpoch;
    multiplayerService.publishPath(_pathUnits);

    _character!.move(speed: 300, points: pathVectors);
  }

  @override
  Color backgroundColor() => const Color(0xFF222222);

  @override
  void update(double dt) {
    _character?.update(dt);
    for (final player in _players.values) {
      player.update(dt);
    }
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

    // Draw our character
    _character?.render(canvas);

    for (final player in _players.values) {
      player.render(canvas);
    }
  }
}
