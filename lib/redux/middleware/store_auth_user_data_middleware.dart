import 'package:redfire/actions.dart';
import 'package:redux/redux.dart';

import '../../main.dart';
import '../../services/locator.dart';
import '../../services/multiplayer_service.dart';

class StoreAuthUserDataMiddleware
    extends TypedMiddleware<AppState, StoreAuthUserDataAction> {
  StoreAuthUserDataMiddleware()
      : super((store, action, next) async {
          next(action);

          if (action.authUserData == null) return;

          final service = MultiplayerService(action.authUserData!.uid, store);
          MultiplayerLocator.provide(service);
        });
}
