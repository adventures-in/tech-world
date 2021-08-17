import 'package:redux/redux.dart';
import 'package:tech_world/actions/profile/update_profile.dart';
import 'package:tech_world/extensions/built_value_extensions.dart';
import 'package:tech_world/models/app/app_state.dart';

class UpdateProfileReducer extends TypedReducer<AppState, UpdateProfile> {
  UpdateProfileReducer()
      : super(
          // Perform a rebuild with updated state for the relevant provider in
          // the Map<Provider, ProviderState> stateOf member.
          (state, action) => state.rebuild(
            (b) => b
              ..profile.stateOf.updateAt(
                  action.provider,
                  (b) => b
                    ..state = action.authorizationState ?? b.state
                    ..step = action.authorizingStep ?? b.step),
          ),
        );
}
