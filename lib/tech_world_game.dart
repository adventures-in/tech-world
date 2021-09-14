import 'dart:async';

import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:tech_world/components/map_component.dart';
import 'package:tech_world/components/player_component.dart';
import 'package:tech_world/main.dart';
import 'package:tech_world/utils/extensions/i_list_of_double2s_extension.dart';
import 'package:tech_world/utils/extensions/i_list_of_vector2s_extension.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

bool _paused = false;
int departureTime = 0;

class TechWorldGame extends BaseGame with KeyboardEvents, TapDetector {
  TechWorldGame(
      {required Stream<AppState> appStateChanges,
      required Sink<ServerMessage> serverSink})
      : _appStateChanges = appStateChanges,
        _serverSink = serverSink;

  // We listen to each state change & check the parts we care about.
  final Stream<AppState> _appStateChanges;
  var _oldState = AppState.init();

  // A sink is passed in that we can use to send messages to the server.
  final Sink<ServerMessage> _serverSink;

  // Components that are used to draw the scene.
  // final String _userId;
  late final PlayerComponent _player;
  String? _userId;
  final Map<String, PlayerComponent> _otherPlayers = {};
  final _map = MapComponent();

  @override
  Future<void> onLoad() async {
    add(_map);

    // Create a character at the origin for player1.
    _player = await PlayerComponent.create('bald.png', start: Position(0, 0));
    add(_player);

    // TODO: add try/catch blocks and onError callback
    _appStateChanges.listen((state) {
      if (_userId != state.auth.userData?.uid) {
        _userId = state.auth.userData?.uid;
      }

      if (_oldState.game.otherPlayerIds != state.game.otherPlayerIds) {
        var removeSet =
            _oldState.game.otherPlayerIds.difference(state.game.otherPlayerIds);
        var addSet =
            state.game.otherPlayerIds.difference(_oldState.game.otherPlayerIds);

        for (var id in removeSet) {
          // remove from the local map of players and from the game
          _otherPlayers.remove(id)?.remove();
        }

        for (var id in addSet) {
          PlayerComponent.create('beard.png', start: Position(0, 0))
              .then((player) {
            // TODO: should we use onDetach or similar to avoid accessing bad memory?
            _otherPlayers[id] = player;
            add(player);
          });
        }
      }

      if (_oldState.game.playerPaths != state.game.playerPaths) {
        // get the set of ids corresponding to new player paths
        var newPaths = state.game.playerPaths
            .toEntryISet()
            .difference(_oldState.game.playerPaths.toEntryISet());
        // add movement effects to all relevant player components
        for (var path in newPaths) {
          _otherPlayers[path.key]!.moveOnPath(
              points: state.game.playerPaths[path.key]!.toVector2s(),
              speed: 300);
        }
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

    // guard statement
    if (_userId == null) return;

    var bigPathLocations =
        _map.createPath(start: _player.position, end: info.eventPosition.game);

    departureTime = DateTime.now().millisecondsSinceEpoch;
    _serverSink.add(PlayerPathMessage(
        userId: _userId!, points: bigPathLocations.toDouble2s()));

    _player.moveOnPath(points: bigPathLocations, speed: 300);
  }

  @override
  Color backgroundColor() => const Color(0xFF222222);
}
