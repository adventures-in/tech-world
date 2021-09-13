import 'dart:async';

import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:tech_world/components/map_component.dart';
import 'package:tech_world/components/other_players_component.dart';
import 'package:tech_world/components/player_component.dart';
import 'package:tech_world/main.dart';
import 'package:tech_world/utils/extensions/i_list_of_vector2s_extension.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

bool _paused = false;
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
  final _map = MapComponent();

  @override
  Future<void> onLoad() async {
    // Create a character at the origin for player1.
    _player = await PlayerComponent.create('bald.png', start: Position(0, 0));

    // TODO: add try/catch blocks and onError callback
    _appStateChanges.listen((state) {
      if (_oldState.game.otherPlayerIds != state.game.otherPlayerIds) {
        _otherPlayers.setIdsAndCreateNewPlayers(state.game.otherPlayerIds);
      }

      if (_oldState.game.playerPaths != state.game.playerPaths) {
        _otherPlayers.updateMovement(state.game.playerPaths);
      }

      _oldState = state;
    });
  }

  @override
  void onKeyEvent(RawKeyEvent event) {
    print(event.data);
    if (event.isShiftPressed) return _togglePausedState();
    _player.moveInDirection(event);
  }

  void _togglePausedState() =>
      (_paused = !_paused) ? pauseEngine() : resumeEngine();

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);

    var bigPathLocations =
        _map.createPath(start: _player.position, end: info.eventPosition.game);

    departureTime = DateTime.now().millisecondsSinceEpoch;
    _serverSink.add(PlayerPathMessage(
        userId: _oldState.auth.userData!.uid,
        points: bigPathLocations.toDouble2s()));

    _player.moveOnPath(points: bigPathLocations, speed: 300);
  }

  @override
  Color backgroundColor() => const Color(0xFF222222);

  @override
  void update(double dt) {
    _otherPlayers.update(dt);
    _player.update(dt);
  }

  // remember - order matters!
  @override
  void render(Canvas canvas) {
    _map.render(canvas);
    _otherPlayers.render(canvas);
    _player.render(canvas);
  }
}
