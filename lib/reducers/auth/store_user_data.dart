import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreUserDataReducer extends TypedReducer<AppState, StoreUserData> {
  StoreUserDataReducer()
      : super((state, action) {
          // guard statement to avoid further null checks
          if (action.userData == null) {
            return state.rebuild((b) => b
              ..userData = null
              ..authStep = AuthStep.waitingForInput);
          }

          var _adventurer = state.adventurer;
          if (action.userData.providers.isNotEmpty) {
            // we take the first of the providers for now
            final providerData = action.userData.providers.first;
            _adventurer = Adventurer(
                id: action.userData.uid,
                displayName: providerData.displayName,
                photoURL: providerData.photoURL);
          }

          return state.rebuild((b) => b
            ..adventurer = _adventurer?.toBuilder()
            ..userData = action.userData?.toBuilder());
        });
}
