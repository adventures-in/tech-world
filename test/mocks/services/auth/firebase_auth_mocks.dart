import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements auth.FirebaseAuth {}

class FakeFirebaseAuth extends Fake implements auth.FirebaseAuth {
  final List<auth.User> _emitUsersList;

  FakeFirebaseAuth(List<auth.User> emitUsersList)
      : _emitUsersList = emitUsersList;

  @override
  Stream<auth.User> authStateChanges() => Stream.fromIterable(_emitUsersList);
}
