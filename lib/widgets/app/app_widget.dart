import 'package:adventures_in_tech_world/actions/app/plumb_services.dart';
import 'package:adventures_in_tech_world/actions/database/plumb_database_stream.dart';
import 'package:adventures_in_tech_world/actions/navigation/remove_current_page.dart';
import 'package:adventures_in_tech_world/extensions/page_data_extensions.dart';
import 'package:adventures_in_tech_world/extensions/theme_data_extensions.dart';
import 'package:adventures_in_tech_world/extensions/theme_mode_extensions.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/app/settings.dart';
import 'package:adventures_in_tech_world/models/navigation/page_data.dart';
import 'package:adventures_in_tech_world/utils/redux_bundle.dart';
import 'package:adventures_in_tech_world/utils/wrappers/firebase_wrapper.dart';
import 'package:adventures_in_tech_world/widgets/app/initializing_error_page.dart';
import 'package:adventures_in_tech_world/widgets/app/initializing_indicator.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppWidget extends StatefulWidget {
  final FirebaseWrapper _firebase;
  final ReduxBundle _redux;

  AppWidget({FirebaseWrapper firebase, ReduxBundle redux})
      : _firebase = firebase ?? FirebaseWrapper(),
        _redux = redux;

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  ReduxBundle _redux;
  Store<AppState> _store;
  dynamic _error;
  bool _initializedFirebase = false;
  bool _initializedRedux = false;

  void initializeFutterFire() async {
    try {
      // firebase must be initialised first so createStore() can run
      await widget._firebase.init();
      setState(() {
        _initializedFirebase = true;
      });

      // use the injected redux bundle if there is one or create one
      _redux = widget._redux ?? ReduxBundle();
      // create the redux store and run any extra operations
      _store = await _redux.createStore();
      setState(() {
        _initializedRedux = true;
      });

      // dispatch initial actions
      // ...

      /// This should happen once on app load, the various streams from the
      /// [FirebaseFirestore] database are changed but the [DatabaseService]'s
      /// [StreamController] stays connected to the redux [Store].
      _store.dispatch(PlumbDatabaseStream());
    } catch (e) {
      setState(() {
        _error = e;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFutterFire();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return InitializingErrorPage(error: _error, trace: StackTrace.current);
    }

    // Show a loader until FlutterFire is initialized
    if (!_initializedFirebase || !_initializedRedux) {
      return InitializingIndicator(
        firebaseDone: _initializedFirebase,
        reduxDone: _initializedRedux,
      );
    }

    return StoreProvider<AppState>(
      store: _store,
      child: StoreConnector<AppState, Settings>(
        onInit: (store) => store.dispatch(PlumbServices()),
        distinct: true,
        converter: (store) => store.state.settings,
        builder: (context, settings) {
          return MaterialApp(
            title: 'AdventuresIn',
            theme: MakeThemeData.from(settings.lightTheme),
            darkTheme: MakeThemeData.from(settings.darkTheme),
            themeMode: MakeThemeMode.from(settings.brightnessMode),
            home: StoreConnector<AppState, BuiltList<PageData>>(
              distinct: true,
              converter: (store) => store.state.pagesData,
              builder: (context, pagesData) => Navigator(
                  pages: pagesData.toPages(),
                  onPopPage: (route, dynamic result) {
                    if (!route.didPop(result)) {
                      return false;
                    }

                    if (route.isCurrent) {
                      _store.dispatch(RemoveCurrentPage());
                    }

                    return true;
                  }),
            ),
          );
        },
      ),
    );
  }
}
