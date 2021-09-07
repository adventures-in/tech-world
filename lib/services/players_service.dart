import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_world/drawing/character_component.dart';

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

  Future<void> createNewAvatars(ISet<String> presentSet) async {
    // Add a player for any new character that came through in the game state.
    for (final playerId in presentSet) {
      if (!_otherPlayers.containsKey(playerId)) {
        _otherPlayers[playerId] =
            await CharacterComponent.create('bald.png', start: Position(9, 9));
      }
    }
  }

  // Create a character at the origin for player1.
  Future<CharacterComponent> createPlayer1Avatar() async {
    _player1 =
        await CharacterComponent.create('bald.png', start: Position(0, 0));

    return _player1!;
  }
}
