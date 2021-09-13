import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flame/components.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_world/drawing/player_component.dart';

class OtherPlayersComponent extends Component {
  final Map<String, PlayerComponent> _otherPlayers = {};

  Future<void> setIdsAndCreateNewPlayers(ISet<String> otherPlayerIds) async {
    // Add a player for any new character that came through in the game state.
    print('there were ${_otherPlayers.length} other players...');
    for (final playerId in otherPlayerIds) {
      if (!_otherPlayers.containsKey(playerId)) {
        _otherPlayers[playerId] =
            await PlayerComponent.create('beard.png', start: Position(50, 50));
      }
    }
    print('now there are ${_otherPlayers.length}.');
  }

  @override
  void update(double dt) {
    super.update(dt);
    for (var player in _otherPlayers.values) {
      player.update(dt);
    }
  }

  @override
  void render(Canvas c) {
    super.render(c);
    for (var player in _otherPlayers.values) {
      player.render(c);
    }
  }
}
