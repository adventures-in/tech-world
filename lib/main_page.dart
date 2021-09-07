import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:tech_world/redux/state/game/game_state.dart';
import 'package:tech_world/services/locator.dart';
import 'package:tech_world/tech_world_game.dart';

import 'main.dart';

final _game = TechWorldGame();
final _playersService = Locator.getPlayersService();

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GameState>(
        distinct: true,
        converter: (store) => store.state.game,
        builder: (context, gameState) {
          print('game state: $gameState');
          _playersService.createNewAvatars(gameState.presentIds);
          return Stack(
            children: [
              GameWidget(game: _game),
              ElevatedButton(
                onPressed: () => context.dispatch<AppState>(SignOutAction()),
                child: const Text('Sign Out'),
              ),
            ],
          );
        });
  }
}
