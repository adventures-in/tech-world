import 'package:redux/redux.dart';
import 'package:tech_world/actions/problems/add_problem.dart';
import 'package:tech_world/models/app/app_state.dart';

class AddProblemReducer extends TypedReducer<AppState, AddProblem> {
  AddProblemReducer()
      : super((state, action) =>
            state.rebuild((b) => b..problems.add(action.problem)));
}
