import 'package:redux/redux.dart';
import 'package:tech_world/actions/profile/update_profile_action.dart';

import '../../main.dart';

class UpdateProfileReducer extends TypedReducer<AppState, UpdateProfileAction> {
  UpdateProfileReducer()
      : super(
            // Perform a rebuild with updated state for the relevant provider in
            // the Map<Provider, ProviderState> stateOf member.
            (state, action) => state.copyWith.profileVM(
                stateOf: state.profileVM.stateOf.update(
                    action.provider,
                    (_) =>
                        action.authorizingStep ??
                        state.profileVM.stateOf[action.provider]!)));
}
