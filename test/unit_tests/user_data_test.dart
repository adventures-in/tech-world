import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:test/test.dart';

void main() {
  group('UserData', () {
    test('.hasGitHub checks providerId and providers list', () {
      final userData = UserData(
          uid: 'uid',
          providerId: 'provider',
          displayName: 'andy',
          photoUrl: 'url',
          email: 'email@email.email',
          phoneNumber: '0423123421',
          createdOn: DateTime.now(),
          lastSignedInOn: DateTime.now(),
          isAnonymous: false,
          isEmailVerified: false,
          providers: BuiltList(<AuthProviderData>[
            AuthProviderData(
                providerId: 'firebase',
                uid: 'uid1234',
                displayName: 'sam',
                photoUrl: 'url2',
                email: 'a@a.com',
                phoneNumber: '1234')
          ]));

      expect(userData.hasGitHub, false);

      final userData2 = userData.rebuild((b) => b..providerId = 'github.com');

      expect(userData2.hasGitHub, true);

      final userData3 = userData.rebuild((b) => b
        ..providers.first =
            b.providers.first.rebuild((b) => b..providerId = 'github.com'));

      expect(userData3.hasGitHub, true);
    });

    test('.hasGitHub (memoized) returns the same value on subsequent calls',
        () {
      final userData = UserData(
          uid: 'uid',
          providerId: 'firebase',
          displayName: 'andy',
          photoUrl: 'url',
          email: 'email@email.email',
          phoneNumber: '0423123421',
          createdOn: DateTime.now(),
          lastSignedInOn: DateTime.now(),
          isAnonymous: false,
          isEmailVerified: false,
          providers: BuiltList(<AuthProviderData>[
            AuthProviderData(
                providerId: 'github.com',
                uid: 'github.com',
                displayName: 'sam',
                photoUrl: 'url2',
                email: 'a@a.com',
                phoneNumber: '1234')
          ]));

      expect(userData.hasGitHub, true);
      expect(userData.hasGitHub, true);
    });
  });
}
