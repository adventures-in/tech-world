import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/src/firebase_app.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class FakeFirebaseAuth implements FirebaseAuth {
  final List<FirebaseUser> _emitUsersList;

  FakeFirebaseAuth(List<FirebaseUser> emitUsersList)
      : _emitUsersList = emitUsersList;

  @override
  Stream<FirebaseUser> get onAuthStateChanged =>
      Stream.fromIterable(_emitUsersList);

  @override
  // TODO: implement app
  FirebaseApp get app => throw UnimplementedError();

  @override
  Future<void> confirmPasswordReset(String oobCode, String newPassword) {
    // TODO: implement confirmPasswordReset
    throw UnimplementedError();
  }

  @override
  Future<AuthResult> createUserWithEmailAndPassword(
      {String email, String password}) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<List<String>> fetchSignInMethodsForEmail({String email}) {
    // TODO: implement fetchSignInMethodsForEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignInWithEmailLink(String link) {
    // TODO: implement isSignInWithEmailLink
    throw UnimplementedError();
  }

  @override
  Future<void> sendPasswordResetEmail({String email}) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<void> sendSignInWithEmailLink(
      {String email,
      String url,
      bool handleCodeInApp,
      String iOSBundleID,
      String androidPackageName,
      bool androidInstallIfNotAvailable,
      String androidMinimumVersion}) {
    // TODO: implement sendSignInWithEmailLink
    throw UnimplementedError();
  }

  @override
  Future<void> setLanguageCode(String language) {
    // TODO: implement setLanguageCode
    throw UnimplementedError();
  }

  @override
  Future<AuthResult> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<AuthResult> signInWithCredential(AuthCredential credential) {
    // TODO: implement signInWithCredential
    throw UnimplementedError();
  }

  @override
  Future<AuthResult> signInWithCustomToken({String token}) {
    // TODO: implement signInWithCustomToken
    throw UnimplementedError();
  }

  @override
  Future<AuthResult> signInWithEmailAndLink({String email, String link}) {
    // TODO: implement signInWithEmailAndLink
    throw UnimplementedError();
  }

  @override
  Future<AuthResult> signInWithEmailAndPassword(
      {String email, String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> verifyPhoneNumber(
      {String phoneNumber,
      Duration timeout,
      int forceResendingToken,
      verificationCompleted,
      verificationFailed,
      codeSent,
      codeAutoRetrievalTimeout}) {
    // TODO: implement verifyPhoneNumber
    throw UnimplementedError();
  }
}
