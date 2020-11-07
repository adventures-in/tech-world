import 'package:adventures_in_tech_world/actions/auth/sign_in_with_google.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:redux/redux.dart';

class SignInWithGoogleMiddleware
    extends TypedMiddleware<AppState, SignInWithGoogle> {
  SignInWithGoogleMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(StoreAuthStep(step: AuthStep.contactingGoogle));

          final credential = await authService.getGoogleCredential();

          store.dispatch(StoreAuthStep(step: AuthStep.signingInWithFirebase));

          // We don't do anyting with the UserData object here as the
          // authStateChanges stream will emit the same object and the state is
          // changed there.
          await authService.signInWithGoogle(credential: credential);
        });
}
