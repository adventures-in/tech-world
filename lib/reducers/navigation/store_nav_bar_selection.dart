import 'package:adventures_in_tech_world/actions/navigation/store_nav_bar_selection.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreNavBarSelectionReducer
    extends TypedReducer<AppState, StoreNavBarSelection> {
  StoreNavBarSelectionReducer()
      : super((state, action) =>
            state.rebuild((b) => b..navSelection = action.selection));
}
