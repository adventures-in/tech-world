import 'dart:async';

import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';

import '../data/user_data_mock_values.dart';

class MockDatabaseService implements DatabaseService {
  /// The stream of the [_storeController] is used just once on app load, to
  /// connect the [_storeController] to the redux [Store]
  /// Functions that observe parts of the database thus don't return anything,
  /// they just connect the store to the database and keep the subscription so
  /// functions that disregard (stop observing) that part of the database just
  /// cancel the subscription.
  @override
  Stream<ReduxAction> get storeStream => _storeController.stream;

  /// The [_storeController] is connected to the redux [Store] via [storeStrea]
  /// and is used by the [DatabaseService] to add actions to the stream where
  /// they will be dispatched by the store.
  final StreamController<ReduxAction> _storeController =
      StreamController<ReduxAction>();

  @override
  void connectTempTokenToStore({String uid}) {
    if (uid == afterGitHubSignInUserData.uid) {
      _storeController.add(StoreGitHubToken(token: 'token'));
    } else {
      _storeController.add(StoreGitHubToken(token: null));
    }
  }

  @override
  void disconnectTempToken({String uid}) {
    // not implemented in mock
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAnonymousAccount(String userId) {
    // not implemented in mock
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserInfo(UserData userData, String token) {
    // not implemented in mock
    throw UnimplementedError();
  }

  @override
  Future<String> retrieveStoredToken(String userId) {
    // not implemented in mock
    throw UnimplementedError();
  }
}
