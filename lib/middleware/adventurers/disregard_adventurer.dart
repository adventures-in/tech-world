import 'package:adventures_in_tech_world/actions/adventurers/disregard_adventurer.dart';
import 'package:adventures_in_tech_world/enums/app/database_section.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:redux/redux.dart';

class DisregardAdventurerMiddleware
    extends TypedMiddleware<AppState, DisregardAdventurer> {
  DisregardAdventurerMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          await databaseService.disconnect(DatabaseSection.adventurerData);
        });
}
