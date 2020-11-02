import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:redux/redux.dart';

/// Middleware that triggers on a [StoreUserData] action and checks if the
/// [UserData] carried by the action is null.
///
/// When the middleware sees the not-signed-in state, it triggers anonymous
/// sign in.
class StoreUserDataMiddleware extends TypedMiddleware<AppState, StoreUserData> {
  StoreUserDataMiddleware(AuthService authService)
      : super((store, action, next) async {
          if (action.userData == null &&
              store.state.authStep != AuthStep.signingInAnonymously) {
            store.dispatch(StoreAuthStep(step: AuthStep.signingInAnonymously));
            final userData = await authService.signInAnonymously();
            next(StoreUserData(userData: userData));
          } else {
            next(action);
          }
        });
}
