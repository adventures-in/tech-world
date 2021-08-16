import 'package:adventures_in_tech_world/actions/platform/detect_platform.dart';
import 'package:adventures_in_tech_world/actions/settings/update_settings.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:redux/redux.dart';

class DetectPlatformMiddleware
    extends TypedMiddleware<AppState, DetectPlatform> {
  DetectPlatformMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          final platform = platformService.detectPlatform();
          store.dispatch(UpdateSettings(platform: platform));
        });
}
