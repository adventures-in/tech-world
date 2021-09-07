import 'package:tech_world/services/networking_service.dart';
import 'package:tech_world/services/players_service.dart';

/// Services are nullable so that we can only provide a service if none exists,
/// allowing for mocks to be set in tests.
///
/// All get_Service functions return non-nullable types. Ensuring the
/// services are not null when they are accessed is up to the developer.
class Locator {
  static NetworkingService getNetworkingService() => _networkingService!;
  static PlayersService getPlayersService() => _playersService!;

  static void provideNetworkingService(NetworkingService service,
      {bool overwrite = true}) {
    if (overwrite == false && _networkingService != null) return;
    _networkingService = service;
  }

  static void providePlayersService(PlayersService service,
      {bool overwrite = true}) {
    if (overwrite == false && _playersService != null) return;
    _playersService = service;
  }

  static bool get hasNetworkingService => _networkingService != null;
  static bool get needsNetworkingService => _networkingService == null;
  static bool get hasPlayersService => _playersService != null;
  static bool get needsPlayersService => _playersService == null;

  static NetworkingService? _networkingService;
  static PlayersService? _playersService;
}
