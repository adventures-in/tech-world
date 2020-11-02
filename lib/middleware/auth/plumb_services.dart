import 'package:adventures_in_tech_world/actions/app/plumb_services.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class PlumbServicesMiddleware extends TypedMiddleware<AppState, PlumbServices> {
  PlumbServicesMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'PlumbServicesMiddleware');

          /// We don't manage the subscription as the streams are expected
          /// to stay open for the whole lifetime of the app
          try {
            databaseService.storeStream
                .listen(store.dispatch, onError: handleProblem);
            authService.storeStream
                .listen(store.dispatch, onError: handleProblem);
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
