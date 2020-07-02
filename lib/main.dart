import 'package:adventures_in/middleware/app_middleware.dart';
import 'package:adventures_in/models/app/app_state.dart';
import 'package:adventures_in/reducers/app_reducer.dart';
import 'package:adventures_in/services/auth_service.dart';
import 'package:adventures_in/services/platform_service.dart';
import 'package:adventures_in/widgets/adventures_in_app.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() {
  /// Create services
  final authService = AuthService();
  final platformService = PlatformService();

  /// Create the redux store
  final store =
      Store<AppState>(appReducer, initialState: AppState.init(), middleware: [
    ...createAppMiddleware(
        authService: authService, platformService: platformService)
  ]);

  runApp(AdventuresInApp(store));
}
