import 'package:redux/redux.dart';
import 'package:tech_world/redux/actions/set_player_path_action.dart';

import '../../main.dart';

class SetPlayerPathReducer extends TypedReducer<AppState, SetPlayerPathAction> {
  SetPlayerPathReducer()
      : super(
          (state, action) => state.copyWith.game(
              playerPaths: (state.game.playerPaths
                  .add(action.message.userId, action.message.points))),
        );
}
