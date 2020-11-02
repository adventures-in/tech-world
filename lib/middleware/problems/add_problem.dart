import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/display_problem.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// This middleware just dispatches a [DisplayProblem] action for each
/// [AddProblem] action that comes through.
class AddProblemMiddleware extends TypedMiddleware<AppState, AddProblem> {
  AddProblemMiddleware()
      : super((store, action, next) async {
          next(action);

          store.dispatch(DisplayProblem(problem: action.problem));
        });
}
