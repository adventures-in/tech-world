import 'package:mockito/mockito.dart';
import 'package:tech_world/services/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

class FakeAuthService extends Fake implements AuthService {}
