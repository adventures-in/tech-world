import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/problems/problem.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final problemsReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, AddProblem>(_addProblem),
];

AppState _addProblem(AppState state, AddProblem action) {
  // create a problem from the action
  final problem = Problem(
      type: action.type,
      errorString: action.errorString,
      traceString: action.traceString,
      info: action.info);

  // add the problem to the store
  return state.rebuild((b) => b..problems.add(problem));
}
