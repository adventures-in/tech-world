import 'package:firebase_auth/firebase_auth.dart';

class FakeFirebaseUser implements FirebaseUser {
  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  // TODO: implement displayName
  String get displayName => throw UnimplementedError();

  @override
  // TODO: implement email
  String get email => throw UnimplementedError();

  @override
  Future<IdTokenResult> getIdToken({bool refresh = false}) {
    // TODO: implement getIdToken
    throw UnimplementedError();
  }

  @override
  // TODO: implement isAnonymous
  bool get isAnonymous => throw UnimplementedError();

  @override
  // TODO: implement isEmailVerified
  bool get isEmailVerified => throw UnimplementedError();

  @override
  Future<AuthResult> linkWithCredential(AuthCredential credential) {
    // TODO: implement linkWithCredential
    throw UnimplementedError();
  }

  @override
  // TODO: implement metadata
  FirebaseUserMetadata get metadata => throw UnimplementedError();

  @override
  // TODO: implement phoneNumber
  String get phoneNumber => throw UnimplementedError();

  @override
  // TODO: implement photoUrl
  String get photoUrl => throw UnimplementedError();

  @override
  // TODO: implement providerData
  List<UserInfo> get providerData => throw UnimplementedError();

  @override
  // TODO: implement providerId
  String get providerId => throw UnimplementedError();

  @override
  Future<AuthResult> reauthenticateWithCredential(AuthCredential credential) {
    // TODO: implement reauthenticateWithCredential
    throw UnimplementedError();
  }

  @override
  Future<void> reload() {
    // TODO: implement reload
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  // TODO: implement uid
  String get uid => throw UnimplementedError();

  @override
  Future<void> unlinkFromProvider(String provider) {
    // TODO: implement unlinkFromProvider
    throw UnimplementedError();
  }

  @override
  Future<void> updateEmail(String email) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword(String password) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<void> updatePhoneNumberCredential(AuthCredential credential) {
    // TODO: implement updatePhoneNumberCredential
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfile(UserUpdateInfo userUpdateInfo) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
