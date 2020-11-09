import 'package:adventures_in_tech_world/actions/profile/update_profile.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class UpdateProfileReducer extends TypedReducer<AppState, UpdateProfile> {
  UpdateProfileReducer()
      : super((state, action) => state.rebuild(
            (b) => b..profile.linkingStep[action.provider] = action.step));
}
