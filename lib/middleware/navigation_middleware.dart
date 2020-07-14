import 'package:adventures_in_tech_world/actions/navigation/launch_url.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:redux/redux.dart';

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createNavigationMiddleware({
  PlatformService platformService,
}) {
  return [
    LaunchURLMiddleware(platformService),
  ];
}

class LaunchURLMiddleware extends TypedMiddleware<AppState, LaunchURL> {
  LaunchURLMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          await platformService.redirectTo(action.url);
        });
}
