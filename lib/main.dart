import 'package:adventures_in_tech_world/utils/redux_bundle.dart';
import 'package:adventures_in_tech_world/utils/services_bundle.dart';
import 'package:adventures_in_tech_world/widgets/adventures_in_app.dart';
import 'package:flutter/material.dart';

void main() async {
  /// The [Firestore] plugin requires binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  /// A [GlobalKey], shared between the [NavigationService] and [MaterialApp]
  /// widget, allows the service to perform navigation with a [BuildContext]
  final navKey = GlobalKey<NavigatorState>();

  /// All the app services bundled together
  final services = ServicesBundle(navKey: navKey);

  // Create the redux bundle (services, middleware, store)
  final redux = ReduxBundle(services);

  runApp(AdventuresInApp(redux.store, navKey));
}
