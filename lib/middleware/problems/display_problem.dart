import 'package:adventures_in_tech_world/actions/problems/display_problem.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// When a [DisplayProblem] action comes through, use the [NavigationService]
/// to display the [Problem], if there is not currently a problem being displayed.
class DisplayProblemMiddleware
    extends TypedMiddleware<AppState, DisplayProblem> {
  DisplayProblemMiddleware()
      : super((store, action, next) async {
          // check the value before dispatch as the reducer will set to false
          final notAlreadyDisplaying = !store.state.displayingProblem;

          next(action);

          // if not already displaying problem
          if (notAlreadyDisplaying) {
            // TODO: display problem and remove after
          }
        });
}
