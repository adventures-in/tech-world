import 'package:adventures_in_tech_world/utils/redux_bundle.dart';
import 'package:adventures_in_tech_world/widgets/adventures_in_app.dart';
import 'package:flutter/material.dart';

void main() async {
  // A plugin accesses ServicesBinding.defaultBinaryMessenger before binding
  // is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Create the redux bundle (services, middleware, store)
  final bundle = await ReduxBundle.create();

  runApp(AdventuresInApp(bundle.store, bundle.navKey));
}
