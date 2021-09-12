import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../redux/state/math/double2.dart';

part 'player_path.freezed.dart';
part 'player_path.g.dart';

@freezed
class PlayerPath with _$PlayerPath {
  factory PlayerPath({required String userId, required IList<Double2> points}) =
      _PlayerPath;

  factory PlayerPath.fromJson(Map<String, Object?> json) =>
      _$PlayerPathFromJson(json);
}
