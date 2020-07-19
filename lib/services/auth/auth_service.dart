import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';

/// Implemented by [FirebaseAuthService]
abstract class AuthService {
  Stream<ReduxAction> get storeStream;
  void connectAuthStateToStore();
  void disconnectAuthState();
  Future<String> signInAnonymously();
  Future<String> signInWithGithub(String token);
  Future<String> linkGithub(String token);
  Future<void> signOut();
}
