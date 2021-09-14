import 'dart:async';
import 'dart:convert';

import 'package:redfire/types.dart' hide JsonMap;
import 'package:tech_world/redux/actions/set_other_player_ids_action.dart';
import 'package:tech_world/redux/actions/set_player_path_action.dart';
import 'package:tech_world/shared/constants.dart' as constants;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

const _uriString = constants.usCentral1;

/// The core of th [NetworkingService] is a websocket connected to a CloudRun
/// instance.
///
/// Incoming events are [_identify]'d, converted to actions and pushed into the
/// stream controlled by [_actionsStreamController].  A middleware ensures the
/// actions are dispatched to the [Store].
class NetworkingService {
  String? _userId;
  int _departureTime = 0;
  late final WebSocketChannel _webSocket;
  late final StreamSubscription _subscription;

  final _actionsStreamController = StreamController<ReduxAction>();
  Stream<ReduxAction> get actionsStream => _actionsStreamController.stream;

  // Create a websocket connected to the server and attach callbacks.
  void connect(String? uid) {
    _userId = uid;
    print('$_userId connecting to $_uriString');
    _webSocket = WebSocketChannel.connect(Uri.parse(_uriString));

    // Listen to the websocket, identify events & add actions to a stream
    _subscription = _webSocket.stream.listen(
      (dynamic data) => _actionsStreamController
          .add(_identify(jsonDecode(data as String) as JsonMap)),
      onError: (dynamic err) =>
          print('${DateTime.now()} > CONNECTION ERROR: $err'),
      onDone: () =>
          '${DateTime.now()} > CONNECTION DONE! closeCode=${_webSocket.closeCode}, closeReason= ${_webSocket.closeReason}',
    );

    _announce();
  }

  // Announce our presence.
  void _announce() =>
      _webSocket.sink.add(jsonEncode(PresentMessage(_userId!).toJson()));

  void publish(ServerMessage message) {
    // record time and send data via websocket
    _departureTime = DateTime.now().millisecondsSinceEpoch;
    final jsonString = jsonEncode(message.toJson());
    _webSocket.sink.add(jsonString);
  }

  ReduxAction _identify(JsonMap json) {
    print('identifying: $json');
    // Check the type of data in the event and respond appropriately.
    if (json['type'] == 'other_player_ids') {
      final otherPlayers = OtherPlayerIdsMessage.fromJson(json);
      return SetOtherPlayerIdsAction(otherPlayers.ids);
    } else {
      final message = PlayerPathMessage.fromJson(json);
      if (message.userId == _userId) {
        print('ws: ${DateTime.now().millisecondsSinceEpoch - _departureTime}');
      }
      return SetPlayerPathAction(message);
    }
  }

  Future<dynamic> close() async {
    await _subscription.cancel();
    return _webSocket.sink.close();
  }
}
