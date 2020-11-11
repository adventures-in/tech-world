import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/auth/apple_id_credential.dart';
import 'package:adventures_in_tech_world/models/auth/auth_user_data.dart';
import 'package:adventures_in_tech_world/models/auth/google_sign_in_credential.dart';
import 'package:meta/meta.dart';

/// Implemented by [FirebaseAuthService]
abstract class AuthService {
  Stream<ReduxAction> get storeStream;
  void connectAuthStateToStore();
  void disconnectAuthState();
  Future<String> getCurrentUserId();
  Future<AuthUserData> signInAnonymously();
  Future<AuthUserData> signInWithGithub(String token);
  Future<GoogleSignInCredential> getGoogleCredential();
  Future<AuthUserData> signInWithGoogle(
      {@required GoogleSignInCredential credential});
  Future<String> getTokenFromGoogle();
  Future<AppleIdCredential> getAppleCredential();
  Future<AuthUserData> signInWithApple(
      {@required AppleIdCredential credential});
  Future<AuthUserData> linkGoogle(
      {@required GoogleSignInCredential credential});
  Future<AuthUserData> linkGithub(String token);
  Future<void> signOut();
}
