import 'package:redux/redux.dart';
import 'package:tech_world/actions/platform/detect_platform.dart';
import 'package:tech_world/actions/settings/update_settings.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/platform_service.dart';

class DetectPlatformMiddleware
    extends TypedMiddleware<AppState, DetectPlatform> {
  DetectPlatformMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          final platform = platformService.detectPlatform();
          store.dispatch(UpdateSettings(platform: platform));
        });
}
