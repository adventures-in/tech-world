import 'package:redux/redux.dart';
import 'package:tech_world/actions/navigation/push_page.dart';
import 'package:tech_world/models/app/app_state.dart';

class PushPageReducer extends TypedReducer<AppState, PushPage> {
  PushPageReducer()
      : super((state, action) =>
            state.rebuild((b) => b..pagesData.add(action.data)));
}
