import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

typedef Operation = Future<void> Function(Store<AppState> store);

/// An object that can be created with an arbitrary function and will run the
/// function on a given [Store].
///
/// [StoreOperation] objects can be added to the [ReduxBundle] class and will
/// be used by any [ReduxBundle] object when [createStore()] is called
class StoreOperation {
  final Operation _operation;

  StoreOperation(Operation operation) : _operation = operation;

  Future<void> runOn(Store<AppState> store) => _operation(store);
}
