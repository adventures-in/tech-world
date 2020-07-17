import 'package:adventures_in_tech_world/actions/navigation/launch_url.dart';
import 'package:adventures_in_tech_world/actions/navigation/navigate_to_profile.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/navigation_service.dart';
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
  NavigationService navigationService,
  PlatformService platformService,
}) {
  return [
    LaunchURLMiddleware(platformService),
    NavigateToProfileMiddleware(navigationService),
  ];
}

class LaunchURLMiddleware extends TypedMiddleware<AppState, LaunchURL> {
  LaunchURLMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          await platformService.redirectTo(action.url);
        });
}

class NavigateToProfileMiddleware
    extends TypedMiddleware<AppState, NavigateToProfile> {
  NavigateToProfileMiddleware(NavigationService navigationService)
      : super((store, action, next) async {
          next(action);

          await navigationService.navigateTo('/profile');
        });
}
