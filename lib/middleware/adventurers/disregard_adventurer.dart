import 'package:redux/redux.dart';
import 'package:tech_world/actions/adventurers/tap_adventurer.dart';
import 'package:tech_world/enums/app/database_section.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/database_service.dart';

class DisregardAdventurerMiddleware
    extends TypedMiddleware<AppState, DisregardAdventurer> {
  DisregardAdventurerMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          databaseService.disconnect(DatabaseSection.adventurerData);
        });
}
