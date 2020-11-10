import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/auth/linking_step.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

          // update the linking step for all providers
          final _linkingStepBuilder = state.profile.linkingStep.toBuilder();
          _linkingStepBuilder[Provider.google] = LinkingStep.notLinked;
          _linkingStepBuilder[Provider.git_hub] = LinkingStep.notLinked;
          _linkingStepBuilder[Provider.asana] = LinkingStep.notLinked;
          for (final providerData in action.userData.providers) {
            if (providerData.providerId == GoogleAuthProvider.PROVIDER_ID) {
              _linkingStepBuilder[Provider.google] = LinkingStep.linked;
            }
            if (providerData.providerId == GithubAuthProvider.PROVIDER_ID) {
              _linkingStepBuilder[Provider.git_hub] = LinkingStep.linked;
            }
          }

          return state.rebuild((b) => b
            ..adventurer.id = action.userData.uid
            ..adventurer.displayName = action.userData.displayName
            ..adventurer.photoURL = action.userData.photoURL
            ..profile.linkingStep = _linkingStepBuilder
            ..userData = action.userData?.toBuilder()
            ..authStep = AuthStep.waitingForInput);
        });
}
