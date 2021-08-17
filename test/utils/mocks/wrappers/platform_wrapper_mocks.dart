import 'package:mockito/mockito.dart';
import 'package:tech_world/utils/wrappers/platform_wrapper.dart';

class FakePlatformWrapper extends Fake implements PlatformWrapper {
  @override
  bool get isIOS => false;
  @override
  bool get isMacOS => true;
}

class MockPlatformWrapper extends Mock implements PlatformWrapper {}
