import 'dart:async';

import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';

import '../data/user_data_mock_values.dart';

class MockAuthService implements AuthService {
  /// [StreamController] for adding auth state actions
  final _storeStreamController = StreamController<ReduxAction>();

  /// The [Stream] is used just once on app load, to
  /// connect the [Database] to the redux [Store]
  @override
  Stream<ReduxAction> get storeStream => _storeStreamController.stream;

  @override
  void connectAuthStateToStore() {
    _storeStreamController
        .add(StoreUserData(userData: afterGitHubSignInUserData));
  }

  @override
  void disconnectAuthState() {
    // not implemented in the mock
    throw UnimplementedError();
  }

  @override
  Future<UserData> linkGithub(String token) {
    // not implemented in the mock
    throw UnimplementedError();
  }

  @override
  Future<UserData> signInAnonymously() {
    // not implemented in the mock
    throw UnimplementedError();
  }

  @override
  Future<UserData> signInWithGithub(String token) {
    // not implemented in the mock
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // not implemented in the mock
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUserId() {
    // not implemented in the mock
    throw UnimplementedError();
  }
}
