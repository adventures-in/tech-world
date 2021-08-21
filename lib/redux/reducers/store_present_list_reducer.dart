import 'package:redux/redux.dart';
import 'package:tech_world/redux/actions/store_present_list_action.dart';

import '../../main.dart';

class StorePresentListReducer
    extends TypedReducer<AppState, StorePresentListAction> {
  StorePresentListReducer()
      : super(
          (state, action) => state.copyWith.game(
              presentIds: state.game.presentIds
                ..addAll(action.presentList.ids)),
        );
}
