import 'package:adventures_in_tech_world/extensions/user_info_extensions.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserExt on FirebaseUser {
  UserData toData() => UserData(
        providerId: providerId,
        uid: uid,
        displayName: displayName,
        photoUrl: photoUrl,
        email: email,
        phoneNumber: phoneNumber,
        createdOn: metadata.creationTime,
        lastSignedInOn: metadata.lastSignInTime,
        isAnonymous: isAnonymous,
        isEmailVerified: isEmailVerified,
        providers: providerData
            .map((userInfo) => userInfo.toAuthProviderData())
            .toList(),
      );
}
