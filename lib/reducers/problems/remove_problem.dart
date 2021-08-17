import 'package:redux/redux.dart';
import 'package:tech_world/actions/problems/remove_problem.dart';
import 'package:tech_world/models/app/app_state.dart';

class RemoveProblemReducer extends TypedReducer<AppState, RemoveProblem> {
  RemoveProblemReducer()
      : super((state, action) => state.rebuild((b) => b
          ..problems.remove(action.problem)
          ..displayingProblem = false));
}
