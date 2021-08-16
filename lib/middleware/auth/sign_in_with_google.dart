import 'package:adventures_in_tech_world/actions/auth/sign_in_with_google.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth_service.dart';
import 'package:adventures_in_tech_world/services/database_service.dart';
import 'package:redux/redux.dart';

class SignInWithGoogleMiddleware
    extends TypedMiddleware<AppState, SignInWithGoogle> {
  SignInWithGoogleMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(StoreAuthStep(step: AuthStep.contactingGoogle));

          final credential = await authService.getGoogleCredential();

          store.dispatch(StoreAuthStep(step: AuthStep.signingInWithFirebase));

          // The authStateChanges stream will emit the same object and the
          // app state's AuthUserData is changed there.
          final authUserData =
              await authService.signInWithGoogle(credential: credential);

          await databaseService.updateAuthToken(
              Provider.google, authUserData.uid, credential.accessToken);
        });
}
