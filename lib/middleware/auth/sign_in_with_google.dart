import 'package:adventures_in_tech_world/actions/auth/sign_in_with_google.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:redux/redux.dart';

class SignInWithGoogleMiddleware
    extends TypedMiddleware<AppState, SignInWithGoogle> {
  SignInWithGoogleMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // We don't do anyting with the UserData object here as the
          // authStateChanges stream will emit the same object and the state is
          // changed there.
          await authService.signInWithGoogle();
        });
}
