import 'package:adventures_in_tech_world/actions/auth/sign_in_with_apple.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:redux/redux.dart';

class SignInWithAppleMiddleware
    extends TypedMiddleware<AppState, SignInWithApple> {
  SignInWithAppleMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(StoreAuthStep(step: AuthStep.contactingApple));

          final appleIdCredential = await authService.getAppleCredential();

          store.dispatch(StoreAuthStep(step: AuthStep.signingInWithFirebase));

          // We don't do anyting with the UserData object here as the
          // authStateChanges stream will emit the same object and the state is
          // changed there.
          await authService.signInWithApple(credential: appleIdCredential);
        });
}
