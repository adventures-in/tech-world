import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/middleware/app_middleware.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/reducers/app_reducer.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/services/auth/firebase_auth_service.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:adventures_in_tech_world/services/database/firestore_service.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/services/navigation_service.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:adventures_in_tech_world/utils/mocks/mock_auth_service.dart';
import 'package:adventures_in_tech_world/utils/mocks/mock_database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

class ReduxBundle {
  /// The redux store
  Store<AppState> _store;

  /// we use a [GlobalKey] to allow navigation from a service
  final GlobalKey<NavigatorState> _navKey;

  /// Services
  AuthService _authService;
  DatabaseService _databaseService;
  PlatformService _platformService;
  NavigationService _navigationService;
  GitHubService _gitHubService;

  /// RemoteDevTools Middleware
  RemoteDevToolsMiddleware _remoteDevtools;

  /// ReduxBundle
  ReduxBundle._() : _navKey = GlobalKey<NavigatorState>() {
    // if in RDT mode, create a RemoteDevToolsMiddleware
    if (const bool.fromEnvironment('RDT')) {
      _remoteDevtools = RemoteDevToolsMiddleware('localhost:8000');
    }

    /// Create services
    if (const bool.fromEnvironment('MOCKS')) {
      _authService = MockAuthService();
      _databaseService = MockDatabaseService();
    } else {
      _authService = FirebaseAuthService(
          FirebaseAuth.instance, StreamController<ReduxAction>());
      _databaseService = FirestoreService(Firestore.instance);
    }
    _platformService = PlatformService();
    _navigationService = NavigationService(_navKey);
    _gitHubService = GitHubService();

    /// Create the redux store
    _store =
        Store<AppState>(appReducer, initialState: AppState.init(), middleware: [
      ...createAppMiddleware(
          authService: _authService,
          gitHubService: _gitHubService,
          databaseService: _databaseService,
          platformService: _platformService,
          navigationService: _navigationService),
      if (const bool.fromEnvironment('RDT')) _remoteDevtools,
    ]);

    // give RDT access to the store
    if (const bool.fromEnvironment('RDT')) {
      _remoteDevtools.store = _store;
    }
  }

  Future<void> _init() async {
    if (const bool.fromEnvironment('RDT')) {
      await _remoteDevtools.connect();
    }
  }

  Store<AppState> get store => _store;
  GlobalKey<NavigatorState> get navKey => _navKey;

  static Future<ReduxBundle> create() async {
    var bundle = ReduxBundle._();
    await bundle._init();
    return bundle;
  }
}
