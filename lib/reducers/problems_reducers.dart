import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/remove_problem.dart';
import 'package:adventures_in_tech_world/actions/problems/store_displaying_problem.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final problemsReducers = <AppState Function(AppState, dynamic)>[
  AddProblemReducer(),
  RemoveProblemReducer(),
  StoreDisplayingProblemReducer(),
];

class AddProblemReducer extends TypedReducer<AppState, AddProblem> {
  AddProblemReducer()
      : super((state, action) =>
            state.rebuild((b) => b..problems.add(action.problem)));
}

class RemoveProblemReducer extends TypedReducer<AppState, RemoveProblem> {
  RemoveProblemReducer()
      : super((state, action) =>
            state.rebuild((b) => b..problems.remove(action.problem)));
}

class StoreDisplayingProblemReducer
    extends TypedReducer<AppState, StoreDisplayingProblem> {
  StoreDisplayingProblemReducer()
      : super((state, action) =>
            state.rebuild((b) => b..displayingProblem = action.value));
}
