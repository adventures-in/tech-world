import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:built_collection/built_collection.dart';

// after anonymous sign in
final afterAnonymousSignInUserData = UserData(
    uid: 'Ro8xRcoQWEfRCd3Qqz4dVFu3ois2',
    providers: BuiltList(<AuthProviderData>[]),
    displayName: null,
    photoURL: null,
    email: null,
    phoneNumber: null,
    createdOn: DateTime.parse('2020-07-12T16:22:31.000Z'),
    lastSignedInOn: DateTime.parse('2020-07-12T16:22:31.000Z'),
    isAnonymous: true,
    emailVerified: false);

// after sign in with github
final afterGitHubSignInUserData = UserData(
    uid: 'EH1CsvnQWEfSGnOPsTbuQsNK22',
    displayName: null,
    photoURL: null,
    email: 'email@gmail.com',
    phoneNumber: null,
    createdOn: DateTime.parse('2020-07-09T18:03:08.000Z'),
    lastSignedInOn: DateTime.parse('2020-07-12T16:23:22.000Z'),
    isAnonymous: false,
    emailVerified: false,
    providers: BuiltList(<AuthProviderData>[
      AuthProviderData(
          providerId: 'github.com',
          uid: 'github.com',
          displayName: 'Tester',
          photoURL:
              'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=wavatar&f=y',
          email: 'email@gmail.com',
          phoneNumber: null)
    ]));
