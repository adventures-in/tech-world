import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/display_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/store_displaying_problem.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/navigation_service.dart';
import 'package:redux/redux.dart';

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createProblemsMiddleware(
    {NavigationService navigationService}) {
  return [
    AddProblemMiddleware(),
    DisplayProblemMiddleware(navigationService),
  ];
}

/// This middleware just dispatches a [DisplayProblem] action for each
/// [AddProblem] action that comes through.
class AddProblemMiddleware extends TypedMiddleware<AppState, AddProblem> {
  AddProblemMiddleware()
      : super((store, action, next) async {
          next(action);

          store.dispatch(DisplayProblem(problem: action.problem));
        });
}

/// When a [DisplayProblem] action comes through, use the [NavigationService]
/// to display the [Problem], if there is not currently a problem being displayed.
class DisplayProblemMiddleware
    extends TypedMiddleware<AppState, DisplayProblem> {
  DisplayProblemMiddleware(NavigationService navigationService)
      : super((store, action, next) async {
          next(action);

          // if not already displaying problem
          if (!store.state.displayingProblem) {
            // set the app state to indicate problem is being displayed
            store.dispatch(StoreDisplayingProblem(value: true));

            // display problem and remove after
            final removeProblem =
                await navigationService.display(action.problem);

            // Set the app state back
            store.dispatch(StoreDisplayingProblem(value: false));

            // Remove the problem
            store.dispatch(removeProblem);
          }
        });
}
