import 'package:adventures_in_tech_world/models/auth/apple_id_credential.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

extension AuthorizationCredentialAppleIDExt on AuthorizationCredentialAppleID {
  AppleIdCredential toBuiltValue() => AppleIdCredential(
      userIdentifier: userIdentifier,
      givenName: givenName,
      familyName: familyName,
      email: email,
      authorizationCode: authorizationCode,
      identityToken: identityToken,
      state: state);
}
