import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/auth/apple_id_credential.dart';
import 'package:adventures_in_tech_world/models/auth/google_sign_in_credential.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:meta/meta.dart';

/// Implemented by [FirebaseAuthService]
abstract class AuthService {
  Stream<ReduxAction> get storeStream;
  void connectAuthStateToStore();
  void disconnectAuthState();
  Future<String> getCurrentUserId();
  Future<UserData> signInAnonymously();
  Future<UserData> signInWithGithub(String token);
  Future<GoogleSignInCredential> getGoogleCredential();
  Future<UserData> signInWithGoogle(
      {@required GoogleSignInCredential credential});
  Future<AppleIdCredential> getAppleCredential();
  Future<UserData> signInWithApple({@required AppleIdCredential credential});
  Future<UserData> linkGithub(String token);
  Future<void> signOut();
}
