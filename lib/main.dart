import 'package:adventures_in_tech_world/middleware/app_middleware.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/reducers/app_reducer.dart';
import 'package:adventures_in_tech_world/services/auth/firebase_auth_service.dart';
import 'package:adventures_in_tech_world/services/database/firestore_service.dart';
import 'package:adventures_in_tech_world/services/navigation_service.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:adventures_in_tech_world/widgets/adventures_in_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() {
  /// we use a [GlobalKey] to allow navigation from a service
  /// ie. the key supplies a [BuildContext]
  ///
  /// The [GlobalKey] is created here and passed to the [NavigationService] as
  /// well as passed in to the [AdventuresInApp] widget so it can be used by the
  /// [MaterialApp] widget
  final navKey = GlobalKey<NavigatorState>();

  /// Create services
  final authService = FirebaseAuthService(FirebaseAuth.instance);
  final databaseService = FirestoreService(Firestore.instance);
  final platformService = PlatformService();
  final navigationService = NavigationService(navKey);

  /// Create the redux store
  final store =
      Store<AppState>(appReducer, initialState: AppState.init(), middleware: [
    ...createAppMiddleware(
        authService: authService,
        databaseService: databaseService,
        platformService: platformService,
        navigationService: navigationService),
  ]);

  runApp(AdventuresInApp(store, navKey));
}
