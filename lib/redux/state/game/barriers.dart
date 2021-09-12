import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

part 'barriers.freezed.dart';
part 'barriers.g.dart';

@freezed
class Barriers with _$Barriers, ReduxModel {
  Barriers._();
  factory Barriers() = _Barriers;

  final IList<Double2> positions = [
    Double2(5, 2),
    Double2(5, 3),
    Double2(5, 4),
    Double2(5, 5),
    Double2(5, 6),
    Double2(5, 7),
    Double2(5, 8),
    Double2(5, 9),
    Double2(7, 7),
    Double2(7, 8),
    Double2(6, 8),
    Double2(1, 0),
    Double2(1, 1),
    Double2(1, 2),
    Double2(1, 3),
    Double2(1, 4),
    Double2(1, 5),
    Double2(1, 6),
    Double2(1, 7),
    Double2(1, 8),
  ].lock;

  factory Barriers.fromJson(Map<String, Object?> json) =>
      _$BarriersFromJson(json);
}
