import 'package:adventures_in_tech_world/actions/adventurers/observe_adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/database_service.dart';
import 'package:redux/redux.dart';

class ObserveAdventurerMiddleware
    extends TypedMiddleware<AppState, ObserveAdventurer> {
  ObserveAdventurerMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          databaseService.connectAdventurerData(
              uid: store.state.authUserData.uid);
        });
}
