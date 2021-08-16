import 'package:adventures_in_tech_world/actions/auth/store_auth_user_data.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreUserDataReducer extends TypedReducer<AppState, StoreAuthUserData> {
  StoreUserDataReducer()
      : super((state, action) {
          // guard statement to avoid further null checks
          if (action.authUserData == null) {
            return state.rebuild((b) => b
              ..authUserData = null
              ..authStep = AuthStep.waitingForInput);
          }

          // update the linking step for all providers
          // final _linkingStepBuilder = state.profile.linkingStep.toBuilder();
          // _linkingStepBuilder[Provider.google] = LinkingStep.notLinked;
          // _linkingStepBuilder[Provider.git_hub] = LinkingStep.notLinked;
          // _linkingStepBuilder[Provider.asana] = LinkingStep.notLinked;
          // for (final providerData in action.userData.providers) {
          //   if (providerData.providerId == GoogleAuthProvider.PROVIDER_ID) {
          //     _linkingStepBuilder[Provider.google] = LinkingStep.linked;
          //   }
          //   if (providerData.providerId == GithubAuthProvider.PROVIDER_ID) {
          //     _linkingStepBuilder[Provider.git_hub] = LinkingStep.linked;
          //   }
          // }

          return state.rebuild((b) => b
            ..adventurer.id = action.authUserData.uid
            ..adventurer.displayName = action.authUserData.displayName
            ..adventurer.photoURL = action.authUserData.photoURL
            ..authUserData = action.authUserData?.toBuilder()
            ..authStep = AuthStep.waitingForInput);
        });
}
