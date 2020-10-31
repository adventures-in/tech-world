import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/middleware/auth_middleware.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import '../../mocks/services/auth/auth_service_mocks.dart';
import '../../mocks/services/database/database_service_mocks.dart';

void main() {
  group('AuthMiddleware -> StoreUserDataMiddleware: ', () {
    test('signs in anonymously when userData is null', () {
      // create mock services that middleware will use
      final mockAuthService = MockAuthService();
      final mockDatabaseService = MockDatabaseService();

      // a store with the mut (with mocked services) and an identity reducer
      final store = Store<AppState>((state, dynamic action) => state,
          initialState: AppState.init(),
          middleware: [
            StoreUserDataMiddleware(mockAuthService, mockDatabaseService)
          ]);

      store.dispatch(StoreUserData(userData: null));

      verify(mockAuthService.signInAnonymously());
      verifyNever(mockDatabaseService.retrieveStoredToken(any));
      verifyNever(
          mockDatabaseService.connectTempTokenToStore(uid: anyNamed('uid')));
    });
  });
}
