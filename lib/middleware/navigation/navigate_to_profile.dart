import 'package:adventures_in_tech_world/actions/navigation/navigate_to_profile.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class NavigateToProfileMiddleware
    extends TypedMiddleware<AppState, NavigateToProfile> {
  NavigateToProfileMiddleware()
      : super((store, action, next) async {
          next(action);

          // TODO: navigateTo('/profile');
        });
}
