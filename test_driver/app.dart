import 'package:adventures_in_tech_world/widgets/app/app_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

void main() async {
  const rdtMode = bool.fromEnvironment('RDT');
  final _remoteDevtools =
      (rdtMode) ? RemoteDevToolsMiddleware<dynamic>('localhost:8000') : null;

  // This line enables the extension.
  enableFlutterDriverExtension();

  /// The [Firestore] plugin requires binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  /// Any extra middlewares we want to add
  final middlewares = <Middleware>[];

  // if in RDT mode, create a RemoteDevToolsMiddleware
  if (rdtMode) {
    middlewares.add(_remoteDevtools);
  }

  // if in RDT mode, connect RDT to the redux store and the devtools server
  // if (rdtMode) {
  //   _remoteDevtools.store = ;
  //   await _remoteDevtools.connect();
  // }

  runApp(AppWidget());
}
