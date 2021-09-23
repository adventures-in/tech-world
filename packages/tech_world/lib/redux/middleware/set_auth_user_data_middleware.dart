import 'dart:async';

import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/redux/app_state.dart';
import 'package:tech_world/redux/services/locator.dart';

class SetAuthUserDataMiddleware
    extends TypedMiddleware<AppState, SetAuthUserDataAction> {
  SetAuthUserDataMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            // first cancel any existing subscription
            _subscription?.cancel();

            if (action.authUserData?.uid == null) {
              // this could be on app load or sign out, disconnect will handle both
              await Locator.networkingService.disconnect();
            } else {
              // listen to the networking service and dispatch any actions
              _subscription = Locator.networkingService.actionsStream
                  .listen(store.dispatch, onError: store.dispatchProblem);
              // ask the netwrking service to connect to the server
              Locator.networkingService.connect(action.authUserData!.uid);
            }
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<ReduxAction>? _subscription;
}
