import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_world/drawing/character_component.dart';
// import 'package:web_socket_game_server_types/'

class PlayersService {
  late final CharacterComponent? _player1;
  final Map<String, CharacterComponent> _otherPlayers = {};

  void update(double dt) {
    _player1?.update(dt);

    for (final player in _otherPlayers.values) {
      player.update(dt);
    }
  }

  void render(Canvas canvas) {
    _player1?.render(canvas);

    for (final player in _otherPlayers.values) {
      player.render(canvas);
    }
  }

  Future<void> createNewAvatars(ISet<String> presentIds) async {
    // Add a player for any new character that came through in the game state.
    print('there were ${_otherPlayers.length} other players...');
    for (final playerId in presentIds) {
      if (!_otherPlayers.containsKey(playerId)) {
        _otherPlayers[playerId] =
            await CharacterComponent.create('bald.png', start: Position(9, 9));
      }
    }
    print('now there are ${_otherPlayers.length}.');
  }

  // Create a character at the origin for player1.
  Future<CharacterComponent> createPlayer1Avatar() async {
    _player1 =
        await CharacterComponent.create('bald.png', start: Position(0, 0));

    return _player1!;
  }
}
