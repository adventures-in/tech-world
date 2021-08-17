import 'package:redux/redux.dart';
import 'package:tech_world/actions/adventurers/store_adventurer.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/google_service.dart';

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
