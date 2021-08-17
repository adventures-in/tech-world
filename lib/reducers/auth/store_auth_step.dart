import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/store_auth_step.dart';
import 'package:tech_world/models/app/app_state.dart';

class StoreAuthStepReducer extends TypedReducer<AppState, StoreAuthStep> {
  StoreAuthStepReducer()
      : super(
            (state, action) => state.rebuild((b) => b..authStep = action.step));
}
