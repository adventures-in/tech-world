import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:tech_world/tech_world_game.dart';

import 'main.dart';

class MainPage extends StatelessWidget {
  const MainPage({required TechWorldGame game, Key? key})
      : _game = game,
        super(key: key);

  final TechWorldGame _game;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GameWidget(game: _game),
        ElevatedButton(
          onPressed: () => context.dispatch<AppState>(SignOutAction()),
          child: const Text('Sign Out'),
        ),
      ],
    );
  }
}
