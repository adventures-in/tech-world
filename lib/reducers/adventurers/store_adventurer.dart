import 'package:adventures_in_tech_world/actions/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreAdventurerReducer extends TypedReducer<AppState, StoreAdventurer> {
  StoreAdventurerReducer()
      : super((state, action) =>
            state.rebuild((b) => b..adventurer.replace(action.adventurer)));
}
