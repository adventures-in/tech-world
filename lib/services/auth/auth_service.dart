import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';

/// Implemented by [FirebaseAuthService]
abstract class AuthService {
  Stream<ReduxAction> get storeStream;
  void connectAuthStateToStore();
  void disconnectAuthState();
  Future<UserData> signInAnonymously();
  Future<UserData> signInWithGithub(String token);
  Future<UserData> linkGithub(String token);
  Future<void> signOut();
}
