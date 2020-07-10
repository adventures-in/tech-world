import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserInfoExt on UserInfo {
  AuthProviderData toAuthProviderData() => AuthProviderData(
        providerId: providerId,
        uid: uid,
        displayName: displayName,
        photoUrl: photoUrl,
        email: email,
        phoneNumber: phoneNumber,
      );
}
