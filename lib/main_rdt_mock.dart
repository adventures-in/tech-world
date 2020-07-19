import 'package:adventures_in_tech_world/middleware/app_middleware.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/reducers/app_reducer.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/services/navigation_service.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:adventures_in_tech_world/utils/mocks/mock_auth_service.dart';
import 'package:adventures_in_tech_world/utils/mocks/mock_database_service.dart';
import 'package:adventures_in_tech_world/widgets/adventures_in_app.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

void main() async {
  // A plugin accesses ServicesBinding.defaultBinaryMessenger before binding
  // is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  final remoteDevtools = RemoteDevToolsMiddleware('localhost:8000');

  /// we use a [GlobalKey] to allow navigation from a service
  final navKey = GlobalKey<NavigatorState>();

  /// Create services
  final authService = MockAuthService();
  final databaseService = MockDatabaseService();
  final platformService = PlatformService();
  final navigationService = NavigationService(navKey);
  final gitHubService = GitHubService();

  /// Create the redux store
  final store =
      Store<AppState>(appReducer, initialState: AppState.init(), middleware: [
    ...createAppMiddleware(
        authService: authService,
        gitHubService: gitHubService,
        databaseService: databaseService,
        platformService: platformService,
        navigationService: navigationService),
    remoteDevtools,
  ]);

  // give RDT access to the store and connect
  remoteDevtools.store = store;
  await remoteDevtools.connect();

  runApp(AdventuresInApp(store, navKey));
}
