import 'package:adventures_in_tech_world/middleware/app_middleware.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/reducers/app_reducer.dart';
import 'package:adventures_in_tech_world/services/auth_service.dart';
import 'package:adventures_in_tech_world/services/database_service.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:adventures_in_tech_world/widgets/adventures_in_app.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() {
  /// Create services
  final authService = AuthService();
  final databaseService = DatabaseService();
  final platformService = PlatformService();

  /// Create the redux store
  final store =
      Store<AppState>(appReducer, initialState: AppState.init(), middleware: [
    ...createAppMiddleware(
        authService: authService,
        databaseService: databaseService,
        platformService: platformService),
  ]);

  runApp(AdventuresInApp(store));
}
