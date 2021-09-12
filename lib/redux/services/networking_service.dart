import 'dart:async';
import 'dart:convert';

import 'package:flame/extensions.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/redux/actions/set_other_player_ids_action.dart';
import 'package:tech_world/redux/actions/set_player_path_action.dart';
import 'package:tech_world/redux/state/game/player_path.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

import '../../extensions/offsets_list_extension.dart';
import '../../utilities/constants.dart' as constants;

final _uriString = constants.localhost;

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
  void connect(String uid) {
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
      _webSocket.sink.add(jsonEncode(AnnouncePresence(_userId!).toJson()));

  void publishPath(List<Offset> pathUnits) {
    final playerPath =
        PlayerPath(userId: _userId!, points: pathUnits.toValues());

    // record time and send data via websocket
    _departureTime = DateTime.now().millisecondsSinceEpoch;
    final jsonString = jsonEncode(playerPath.toJson());
    _webSocket.sink.add(jsonString);
  }

  ReduxAction _identify(JsonMap json) {
    print('identifying: $json');
    // Check the type of data in the event and respond appropriately.
    if (json['type'] == 'other_player_ids') {
      final otherPlayers = OtherPlayerIds.fromJson(json);
      return SetOtherPlayerIdsAction(otherPlayers.ids);
    } else {
      final pathData = PlayerPath.fromJson(json);
      if (pathData.userId == _userId) {
        print('ws: ${DateTime.now().millisecondsSinceEpoch - _departureTime}');
      }
      return SetPlayerPathAction(pathData);
    }
  }

  Future<dynamic> close() async {
    await _subscription.cancel();
    return _webSocket.sink.close();
  }
}
