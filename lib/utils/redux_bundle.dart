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
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:adventures_in_tech_world/utils/store_operation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';

/// Services can be injected, or if missing are given default values
class ReduxBundle {
  static var _bucketName = 'gs://crowdleague-profile-pics';
  static var _extraMiddlewares = <Middleware>[];
  static var _storeOperations = <StoreOperation>[];
  static Settings _firestoreSettings;

  static void setup(
      {String bucketName,
      List<Middleware> extraMiddlewares,
      List<StoreOperation> storeOperations,
      Settings firestoreSettings}) {
    _bucketName = bucketName ?? _bucketName;
    _extraMiddlewares = extraMiddlewares ?? _extraMiddlewares;
    _storeOperations = storeOperations ?? _storeOperations;
    _firestoreSettings = firestoreSettings;
  }

  /// Services
  final AuthService _authService;
  final DatabaseService _databaseService;
  final PlatformService _platformService;
  final GitHubService _gitHubService;

  ReduxBundle(
      {List<Middleware> extraMiddlewares,
      AuthService authService,
      DatabaseService databaseService,
      PlatformService platformService,
      GitHubService gitHubService})
      : _authService = authService ??
            FirebaseAuthService(
                FirebaseAuth.instance, StreamController<ReduxAction>()),
        _databaseService =
            databaseService ?? FirestoreService(FirebaseFirestore.instance),
        _platformService = platformService ?? PlatformService(),
        _gitHubService = gitHubService ?? GitHubService();

  AuthService get auth => _authService;
  DatabaseService get database => _databaseService;
  PlatformService get platformService => _platformService;
  GitHubService get gitHubService => _gitHubService;

  Future<Store<AppState>> createStore() async {
    final _store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: [
        ...createAppMiddleware(
            authService: _authService,
            databaseService: _databaseService,
            platformService: _platformService,
            gitHubService: _gitHubService),
        ..._extraMiddlewares
      ],
    );

    // now that we have a store, run any store operations that were added
    for (final operation in _storeOperations) {
      await operation.runOn(_store);
    }

    // finally, if firestore settings were added, set the instance to use them
    if (_firestoreSettings != null) {
      FirebaseFirestore.instance.settings = _firestoreSettings;
    }

    return _store;
  }
}
