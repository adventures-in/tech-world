import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/observe_auth_state.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/auth_service.dart';
import 'package:tech_world/utils/problems_utils.dart';

class ObserveAuthStateMiddleware
    extends TypedMiddleware<AppState, ObserveAuthState> {
  ObserveAuthStateMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'ConnectAuthStateMiddleware');

          try {
            authService.connectAuthStateToStore();
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}
