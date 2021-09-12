import 'dart:async';

import 'package:a_star_algorithm/a_star_algorithm.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:tech_world/drawing/other_players_component.dart';
import 'package:tech_world/drawing/player_component.dart';
import 'package:tech_world/extensions/offsets_list_extension.dart';
import 'package:tech_world/main.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

import 'drawing/map_components.dart';
import 'extensions/offset_extension.dart';
import 'extensions/vector2_extension.dart';

bool _paused = false;
var _clickedUnit = Vector2(0, 0);
List<Offset> _pathLocations = [];
int departureTime = 0;

class TechWorldGame extends Game with KeyboardEvents, TapDetector {
  TechWorldGame(
      {required Stream<AppState> appStateChanges,
      required Sink<GameServerMessage> serverSink})
      : _appStateChanges = appStateChanges,
        _serverSink = serverSink;

  // We listen to each state change & check the parts we care about.
  final Stream<AppState> _appStateChanges;
  var _oldState = AppState.init();

  // A sink is passed in that we can use to send messages to the server.
  final Sink<GameServerMessage> _serverSink;

  // Components that are used to draw the scene.
  late final PlayerComponent _player;
  final _otherPlayers = OtherPlayersComponent();
  final _mapComponents = MapComponents();

  @override
  Future<void> onLoad() async {
    // Create a character at the origin for player1.
    _player = await PlayerComponent.create('bald.png', start: Position(0, 0));

    // TODO: add try/catch blocks and onError callback
    _appStateChanges.listen((state) {
      if (_oldState.game.otherPlayerIds != state.game.otherPlayerIds) {
        _otherPlayers.setIdsAndCreateNewPlayers(state.game.otherPlayerIds);
      }

      _oldState = state;
    });
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
      end: _player.position.inUnits.toOffset(),
      barriers: _mapComponents.barrierOffsets,
    ).findThePath()
      ..add(_clickedUnit.toOffset());

    final bigPathLocations =
        _pathLocations.map((offset) => (offset).toVector2() * 64).toList();

    departureTime = DateTime.now().millisecondsSinceEpoch;
    _serverSink.add(PlayerPathMessage(
        userId: _oldState.auth.userData!.uid,
        points: _pathLocations.toValues()));

    _player.move(speed: 300, points: bigPathLocations);
  }

  @override
  Color backgroundColor() => const Color(0xFF222222);

  @override
  void update(double dt) {
    _player.update(dt);
    _otherPlayers.update(dt);
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

    _player.render(canvas);
    _otherPlayers.render(canvas);
  }
}
