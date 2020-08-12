import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/services/auth/firebase_auth_service.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:adventures_in_tech_world/services/database/firestore_service.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/services/navigation_service.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

/// Services can be injected, or if missing are given default values
class ServicesBundle {
  /// Services
  final AuthService _authService;
  final DatabaseService _databaseService;
  final PlatformService _platformService;
  final NavigationService _navigationService;
  final GitHubService _gitHubService;

  ServicesBundle({
    @required GlobalKey<NavigatorState> navKey,
    AuthService authService,
    DatabaseService databaseService,
    PlatformService platformService,
    NavigationService navigationService,
    GitHubService gitHubService,
  })  : _authService = authService ??
            FirebaseAuthService(
                FirebaseAuth.instance, StreamController<ReduxAction>()),
        _databaseService =
            databaseService ?? FirestoreService(Firestore.instance),
        _platformService = platformService ?? PlatformService(),
        _navigationService = navigationService ?? NavigationService(navKey),
        _gitHubService = gitHubService ?? GitHubService();

  AuthService get auth => _authService;
  DatabaseService get database => _databaseService;
  PlatformService get platform => _platformService;
  NavigationService get navigation => _navigationService;
  GitHubService get gitHub => _gitHubService;
}
