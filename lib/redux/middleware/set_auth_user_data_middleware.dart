import 'package:redfire/actions.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/redux/services/locator.dart';

import '../../main.dart';

class SetAuthUserDataMiddleware
    extends TypedMiddleware<AppState, SetAuthUserDataAction> {
  SetAuthUserDataMiddleware()
      : super((store, action, next) async {
          next(action);
          Locator.networkingService.actionsStream.listen(store.dispatch);
          Locator.networkingService.connect(action.authUserData?.uid);
        });
}
