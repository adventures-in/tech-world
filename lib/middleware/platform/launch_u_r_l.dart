import 'package:redux/redux.dart';
import 'package:tech_world/actions/platform/launch_url.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/platform_service.dart';

class LaunchURLMiddleware extends TypedMiddleware<AppState, LaunchURL> {
  LaunchURLMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          await platformService.redirectTo(action.url);
        });
}
