import 'package:redux/redux.dart';
import 'package:tech_world/actions/problems/display_problem.dart';
import 'package:tech_world/models/app/app_state.dart';

class DisplayProblemReducer extends TypedReducer<AppState, DisplayProblem> {
  DisplayProblemReducer()
      : super((state, action) =>
            state.rebuild((b) => b..displayingProblem = true));
}
