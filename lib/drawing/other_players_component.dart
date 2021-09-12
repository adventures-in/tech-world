import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_world/drawing/player_component.dart';

class OtherPlayersComponent {
  final Map<String, PlayerComponent> _otherPlayers = {};

  void update(double dt) {
    for (var player in _otherPlayers.values) {
      player.update(dt);
    }
  }

  void render(Canvas canvas) {
    for (var player in _otherPlayers.values) {
      player.render(canvas);
    }
  }

  Future<void> setIdsAndCreateNewPlayers(ISet<String> otherPlayerIds) async {
    // Add a player for any new character that came through in the game state.
    print('there were ${_otherPlayers.length} other players...');
    for (final playerId in otherPlayerIds) {
      if (!_otherPlayers.containsKey(playerId)) {
        _otherPlayers[playerId] =
            await PlayerComponent.create('bald.png', start: Position(50, 50));
      }
    }
    print('now there are ${_otherPlayers.length}.');
  }
}
