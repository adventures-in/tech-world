import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

extension IListOfDouble2sExtension on IList<Double2> {
  IList<Vector2> toVector2s() =>
      map<Vector2>((d) => Vector2(d.x.toDouble(), d.y.toDouble())).toIList();
}
