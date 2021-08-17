import 'dart:async';

import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/adventurers/store_adventurer_action.dart';
import 'package:tech_world/actions/adventurers/tap_adventurer_action.dart';
import 'package:tech_world/models/adventurers/adventurer.dart';

import '../../main.dart';

class TapAdventurerMiddleware
    extends TypedMiddleware<AppState, TapAdventurerAction> {
  TapAdventurerMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            await _subscription?.cancel();
            if (action.turnOff) {
              return;
            }

            final service = RedFireLocator.getDatabaseService();

            final uid = store.state.auth.userData!.uid;

            /// Observe the document at /adventurers/${uid} and convert each
            /// [DocumentSnapshot] into a [ReduxAction] dispatched to the store.

            final adventurerChanges =
                service.tapDocument(at: 'adventurers/$uid');

            // ... direct the stream to the store.
            _subscription = adventurerChanges.listen((event) {
              store.dispatch(StoreAdventurerAction(Adventurer.fromJson(event)));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<JsonMap>? _subscription;
}
