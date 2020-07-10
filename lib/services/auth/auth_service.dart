import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';

/// Implemented by [FirebaseAuthService]
abstract class AuthService {
  Stream<ReduxAction> get storeStream;
  void connectAuthState();
  void disconnectAuthState();
  Future<void> signInAnonymously();
  Future<void> linkGithub(String token);
  Future<void> signInWithGithub(String token);
  Future<void> signOut();
}
