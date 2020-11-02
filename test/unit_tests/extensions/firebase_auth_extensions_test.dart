import 'dart:async';

import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/extensions/firebase_auth_extensions.dart';
import 'package:test/test.dart';

import '../../utils/mocks/services/auth/firebase_auth_mocks.dart';
import '../../utils/mocks/services/auth/firebase_user_mocks.dart';

void main() {
  group('Firebase Auth Extensions -> ', () {
    test(
        'connectAuthStateToStore listens to onAuthStateChanged and emits StoreUserData',
        () {
      final fakeFirebaseAuth = FakeFirebaseAuth([FakeFirebaseUser()]);
      final controller = StreamController<ReduxAction>();

      fakeFirebaseAuth.connectAuthStateToStore(controller);

      controller.stream.listen(expectAsync1((action) {
        expect(action is AddProblem, true);
        final addProblemAction = action as AddProblem;
        final problemInfo = addProblemAction.problem.info;
        expect(problemInfo['type'], UnimplementedError);
        expect(problemInfo['location'],
            'ConnectAndConvert on FirebaseAuth -> connectAuthStateToStore'); // StoreUserData
      }, count: 1));
    });
  });
}
