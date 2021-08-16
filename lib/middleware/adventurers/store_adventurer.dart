import 'package:adventures_in_tech_world/actions/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/google_service.dart';
import 'package:redux/redux.dart';

/// Add any tokens to the relevant services.
class StoreAdventurerMiddleware
    extends TypedMiddleware<AppState, StoreAdventurer> {
  StoreAdventurerMiddleware(GoogleService googleService)
      : super((store, action, next) async {
          next(action);

          if (action.adventurer.googleToken != null) {
            googleService.token = action.adventurer.googleToken;
          }
        });
}
