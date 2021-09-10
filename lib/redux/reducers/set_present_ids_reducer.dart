import 'package:redux/redux.dart';
import 'package:tech_world/redux/actions/set_present_ids_action.dart';

import '../../main.dart';

class SetPresentIdsReducer extends TypedReducer<AppState, SetPresentIdsAction> {
  SetPresentIdsReducer()
      : super(
          (state, action) => state.copyWith
              .game(presentIds: state.game.presentIds..addAll(action.ids)),
        );
}
