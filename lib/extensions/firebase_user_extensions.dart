import 'package:adventures_in_tech_world/extensions/user_info_extensions.dart';
import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

extension FirebaseUserExt on auth.User {
  UserData toData() => (this != null)
      ? UserData(
          uid: uid,
          displayName: displayName,
          photoURL: photoURL,
          email: email,
          phoneNumber: phoneNumber,
          createdOn: metadata.creationTime.toUtc(),
          lastSignedInOn: metadata.lastSignInTime.toUtc(),
          isAnonymous: isAnonymous,
          emailVerified: emailVerified,
          providers: BuiltList(providerData.map<AuthProviderData>(
              (userInfo) => userInfo.toAuthProviderData())),
        )
      : null;
}
