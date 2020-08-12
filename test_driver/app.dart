import 'package:adventures_in_tech_world/utils/redux_bundle.dart';
import 'package:adventures_in_tech_world/utils/services_bundle.dart';
import 'package:adventures_in_tech_world/widgets/adventures_in_app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

void main() async {
  const rdtMode = bool.fromEnvironment('RDT');
  final _remoteDevtools =
      (rdtMode) ? RemoteDevToolsMiddleware('localhost:8000') : null;

  // This line enables the extension.
  enableFlutterDriverExtension();

  /// The [Firestore] plugin requires binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  /// A [GlobalKey], shared between the [NavigationService] and [MaterialApp]
  /// widget, allows the service to perform navigation with a [BuildContext]
  final navKey = GlobalKey<NavigatorState>();

  /// All the app services bundled together
  final services = ServicesBundle(navKey: navKey);

  /// Any extra middlewares we want to add
  final middlewares = <Middleware>[];

  // if in RDT mode, create a RemoteDevToolsMiddleware
  if (rdtMode) {
    middlewares.add(_remoteDevtools);
  }

  // Create the redux bundle (services, middleware, store)
  final redux = ReduxBundle(services, extraMiddlewares: middlewares);

  // if in RDT mode, connect RDT to the redux store and the devtools server
  if (rdtMode) {
    _remoteDevtools.store = redux.store;
    await _remoteDevtools.connect();
  }

  runApp(AdventuresInApp(redux.store, navKey));
}
