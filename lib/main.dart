import 'package:adventures_in/models/app/app_state.dart';
import 'package:adventures_in/reducers/app_reducer.dart';
import 'package:adventures_in/widgets/adventures_in_app.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() {
  /// Create the redux store
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
  );

  runApp(AdventuresInApp(store));
}
