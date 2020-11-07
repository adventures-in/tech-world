import 'package:adventures_in_tech_world/models/auth/google_sign_in_credential.dart';
import 'package:google_sign_in/google_sign_in.dart';

extension GoogleSignInAuthenticationExt on GoogleSignInAuthentication {
  GoogleSignInCredential toBuiltValue() => GoogleSignInCredential(
      idToken: idToken,
      accessToken: accessToken,
      serverAuthCode: serverAuthCode);
}
