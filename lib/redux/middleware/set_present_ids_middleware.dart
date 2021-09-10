import 'package:redfire/extensions.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/redux/actions/set_present_ids_action.dart';
import 'package:tech_world/redux/services/locator.dart';

class SetPresentIdsMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, SetPresentIdsAction> {
  SetPresentIdsMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            await Locator.playersService.createNewAvatars(action.ids);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
