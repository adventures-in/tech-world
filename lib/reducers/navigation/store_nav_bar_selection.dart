import 'package:redux/redux.dart';
import 'package:tech_world/actions/navigation/store_nav_bar_selection.dart';
import 'package:tech_world/models/app/app_state.dart';

class StoreNavBarSelectionReducer
    extends TypedReducer<AppState, StoreNavBarSelection> {
  StoreNavBarSelectionReducer()
      : super((state, action) =>
            state.rebuild((b) => b..navSelection = action.selection));
}
