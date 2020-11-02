import 'dart:async';

import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:test/fake.dart';

import '../data/user_data_mock_values.dart';

class FakeAuthService extends Fake implements AuthService {
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
}
