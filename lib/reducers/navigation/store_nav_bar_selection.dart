import 'package:redux/redux.dart';
import 'package:tech_world/actions/navigation/store_nav_bar_selection.dart';

import '../../main.dart';

class StoreNavBarSelectionReducer
    extends TypedReducer<AppState, StoreNavBarSelection> {
  StoreNavBarSelectionReducer()
      : super(
            (state, action) => state.copyWith(navSelection: action.selection));
}
