import 'package:adventures_in_tech_world/extensions/user_info_extensions.dart';
import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserExt on FirebaseUser {
  UserData toData() => (this != null)
      ? UserData(
          providerId: providerId,
          uid: uid,
          displayName: displayName,
          photoUrl: photoUrl,
          email: email,
          phoneNumber: phoneNumber,
          createdOn: metadata.creationTime.toUtc(),
          lastSignedInOn: metadata.lastSignInTime.toUtc(),
          isAnonymous: isAnonymous,
          isEmailVerified: isEmailVerified,
          providers: BuiltList(providerData.map<AuthProviderData>(
              (userInfo) => userInfo.toAuthProviderData())),
        )
      : null;
}
