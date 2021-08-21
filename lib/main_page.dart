import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tech_world/redux/state/game/game_state.dart';
import 'package:tech_world/tech_world_game.dart';

import 'main.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GameState>(
        onInit: (store) => {
              // This stops the beeping on macos.
              RawKeyboard.instance.keyEventHandler = (event) => true
            },
        distinct: true,
        converter: (store) => store.state.game,
        builder: (context, gameState) =>
            GameWidget(game: TechWorldGame(gameState)));
  }
}
