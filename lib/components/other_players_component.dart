import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flame/components.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_world/components/player_component.dart';
import 'package:tech_world/utils/extensions/i_list_of_double2s_extension.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

class OtherPlayersComponent extends Component {
  final Map<String, PlayerComponent> _otherPlayers = {};

  Future<void> setIdsAndCreateNewPlayers(ISet<String> otherPlayerIds) async {
    // Add a player for any new character that came through in the game state.
    print('there were ${_otherPlayers.length} other players...');
    for (final playerId in otherPlayerIds) {
      if (!_otherPlayers.containsKey(playerId)) {
        _otherPlayers[playerId] =
            await PlayerComponent.create('beard.png', start: Position(0, 0));
      }
    }
    print('now there are ${_otherPlayers.length}.');
  }

  void updateMovement(IMap<String, IList<Double2>> pathsMap) {
    for (String userId in pathsMap.keys) {
      //  bigPathLocations
      _otherPlayers[userId]
          ?.moveOnPath(points: pathsMap[userId]!.toVector2s(), speed: 300);
    }
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
