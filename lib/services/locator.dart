import 'package:tech_world/services/multiplayer_service.dart';

class MultiplayerLocator {
  static MultiplayerService getService() => _service;
  static void provide(MultiplayerService service) => _service = service;
  static late MultiplayerService _service;
}
