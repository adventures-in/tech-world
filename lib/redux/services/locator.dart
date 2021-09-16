import 'package:tech_world/redux/services/networking_service.dart';

/// Services are nullable so that we can only provide a service if none exists,
/// allowing for mocks to be set in tests.
///
/// All get_Service functions return non-nullable types. Ensuring the
/// services are not null when they are accessed is up to the developer.
class Locator {
  static NetworkingService get networkingService => _networkingService!;

  // static void provideNetworkingService(NetworkingService service,
  //     {bool overwrite = true}) {
  //   if (overwrite == false && _networkingService != null) return;
  //   _networkingService = service;
  // }

  static NetworkingService provideDefaultNetworkingService() {
    _networkingService ??= NetworkingService();
    return _networkingService!;
  }

  static bool get hasNetworkingService => _networkingService != null;
  static bool get needsNetworkingService => _networkingService == null;

  static NetworkingService? _networkingService;
}
