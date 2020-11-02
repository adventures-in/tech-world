import 'dart:async';

import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/utils/redux_bundle.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:redux/src/store.dart';

import 'mocks/services/auth/auth_service_mocks.dart';
import 'mocks/services/database/database_service_mocks.dart';

class FakeReduxBundle extends ReduxBundle {
  final Completer<Store<AppState>> _reduxCompleter;

  FakeReduxBundle(
      {@required Completer<Store<AppState>> completer,
      GlobalKey<NavigatorState> navKey})
      : _reduxCompleter = completer,
        super(
          authService: FakeAuthService(),
          databaseService: FakeDatabaseService(),
        );

  @override
  Future<Store<AppState>> createStore() => _reduxCompleter.future;
}
