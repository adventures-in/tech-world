import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:ws_game_server_types/ws_game_server_types.dart';

extension IListOfVector2sExtension on IList<Vector2> {
  IList<Double2> toDouble2s() =>
      map<Double2>((v) => Double2(v.x, v.y)).toIList();
}
