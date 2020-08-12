import 'package:adventures_in_tech_world/middleware/app_middleware.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/reducers/app_reducer.dart';
import 'package:adventures_in_tech_world/utils/services_bundle.dart';
import 'package:redux/redux.dart';

/// ReduxBundle
class ReduxBundle {
  /// The redux store
  final Store<AppState> _store;

  /// Create the redux store
  ReduxBundle(ServicesBundle services,
      {List<Middleware> extraMiddlewares = const []})
      : _store = Store<AppState>(appReducer,
            initialState: AppState.init(),
            middleware: [
              ...createAppMiddleware(
                  authService: services.auth,
                  gitHubService: services.gitHub,
                  databaseService: services.database,
                  platformService: services.platform,
                  navigationService: services.navigation),
              ...extraMiddlewares,
            ]);

  Store<AppState> get store => _store;
}
