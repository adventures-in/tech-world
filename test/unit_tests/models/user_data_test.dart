import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:adventures_in_tech_world/models/auth/auth_user_data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:test/test.dart';

void main() {
  group('AuthUserData', () {
    test('.hasGitHub checks providerId and providers list', () {
      final authUserData = AuthUserData(
          uid: 'uid',
          displayName: 'andy',
          photoURL: 'url',
          email: 'email@email.email',
          phoneNumber: '0423123421',
          createdOn: DateTime.now(),
          lastSignedInOn: DateTime.now(),
          isAnonymous: false,
          emailVerified: false,
          providers: BuiltList(<AuthProviderData>[
            AuthProviderData(
                providerId: 'firebase',
                uid: 'uid1234',
                displayName: 'sam',
                photoURL: 'url2',
                email: 'a@a.com',
                phoneNumber: '1234')
          ]));

      expect(authUserData.hasGitHub, false);

      final authUserData2 = authUserData.rebuild((b) => b
        ..providers.add(AuthProviderData(
            providerId: 'github.com',
            uid: 'uid2',
            displayName: null,
            photoURL: null,
            email: null,
            phoneNumber: null)));

      expect(authUserData2.hasGitHub, true);

      final authUserData3 = authUserData.rebuild((b) => b
        ..providers.first =
            b.providers.first.rebuild((b) => b..providerId = 'github.com'));

      expect(authUserData3.hasGitHub, true);
    });

    test('.hasGitHub (memoized) returns the same value on subsequent calls',
        () {
      final authUserData = AuthUserData(
          uid: 'uid',
          displayName: 'andy',
          photoURL: 'url',
          email: 'email@email.email',
          phoneNumber: '0423123421',
          createdOn: DateTime.now(),
          lastSignedInOn: DateTime.now(),
          isAnonymous: false,
          emailVerified: false,
          providers: BuiltList(<AuthProviderData>[
            AuthProviderData(
                providerId: 'github.com',
                uid: 'github.com',
                displayName: 'sam',
                photoURL: 'url2',
                email: 'a@a.com',
                phoneNumber: '1234')
          ]));

      expect(authUserData.hasGitHub, true);
      expect(authUserData.hasGitHub, true);
    });
  });
}
