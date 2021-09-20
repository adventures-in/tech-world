import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:tech_world/redux/actions/set_other_player_ids_action.dart';
import 'package:tech_world/redux/app_state.dart';
import 'package:tech_world/redux/reducers/set_other_player_ids_reducer.dart';
import 'package:test/test.dart';

void main() {
  group('SetOtherPlayerIdsReducer', () {
    test('should update otherPlayerIds', () {
      const testIds = ISetConst({'1', '2'});

      final initialState = AppState.init();
      expect(initialState.auth.userData, null);

      final reducer = SetOtherPlayerIdsReducer();
      final newState =
          reducer.reducer(initialState, SetOtherPlayerIdsAction(testIds));

      expect(newState.game.otherPlayerIds, testIds);
    });
  });
}
