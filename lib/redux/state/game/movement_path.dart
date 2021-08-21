import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../redux/state/math/double2.dart';

part 'movement_path.freezed.dart';
part 'movement_path.g.dart';

@freezed
class MovementPath with _$MovementPath {
  factory MovementPath(
      {required String userId, required List<Double2> points}) = _MovementPath;

  factory MovementPath.fromJson(Map<String, Object?> json) =>
      _$MovementPathFromJson(json);
}
