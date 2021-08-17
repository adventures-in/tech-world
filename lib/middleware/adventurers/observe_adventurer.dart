import 'package:redux/redux.dart';
import 'package:tech_world/actions/adventurers/observe_adventurer.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/database_service.dart';

class ObserveAdventurerMiddleware
    extends TypedMiddleware<AppState, ObserveAdventurer> {
  ObserveAdventurerMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          databaseService.connectAdventurerData(
              uid: store.state.authUserData.uid);
        });
}
