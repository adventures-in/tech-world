import 'package:adventures_in_tech_world/actions/problems/display_problem.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class DisplayProblemReducer extends TypedReducer<AppState, DisplayProblem> {
  DisplayProblemReducer()
      : super((state, action) =>
            state.rebuild((b) => b..displayingProblem = true));
}
