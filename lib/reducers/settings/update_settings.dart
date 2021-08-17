import 'package:redux/redux.dart';
import 'package:tech_world/actions/settings/update_settings.dart';
import 'package:tech_world/models/app/app_state.dart';

class UpdateSettingsReducer extends TypedReducer<AppState, UpdateSettings> {
  UpdateSettingsReducer()
      : super((state, action) => state.rebuild((b) =>
            b..settings.platform = action.platform ?? state.settings.platform));
}
