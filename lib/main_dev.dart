import 'dart:io';

import 'package:adventures_in/middleware/app_middleware.dart';
import 'package:adventures_in/models/app/app_state.dart';
import 'package:adventures_in/reducers/app_reducer.dart';
import 'package:adventures_in/services/auth_service.dart';
import 'package:adventures_in/services/platform_service.dart';
import 'package:adventures_in/widgets/adventures_in_app.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

void main() async {
  final remoteDevtools = RemoteDevToolsMiddleware('localhost:8000');

  /// Create services
  final authService = AuthService();
  final platformService = PlatformService();

  /// Create the redux store
  final store =
      Store<AppState>(appReducer, initialState: AppState.init(), middleware: [
    remoteDevtools,
    ...createAppMiddleware(
        authService: authService, platformService: platformService)
  ]);

  // give RDT access to the store
  remoteDevtools.store = store;

  // try to connect and print out any exception thrown
  try {
    await remoteDevtools.connect();
  } on SocketException catch (e) {
    print(e);
  }

  runApp(AdventuresInApp(store, Uri.base.queryParameters));
}
