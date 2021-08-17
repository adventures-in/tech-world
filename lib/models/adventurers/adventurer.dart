import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'adventurer.freezed.dart';
part 'adventurer.g.dart';

@freezed
class Adventurer with _$Adventurer, ReduxModel {
  factory Adventurer(
      {required String id,
      String? displayName,
      String? photoURL,
      String? firstName,
      String? lastName,
      String? gitHubToken,
      String? googleToken,
      String? asanaToken}) = _Adventurer;

  factory Adventurer.fromJson(Map<String, Object?> json) =>
      _$AdventurerFromJson(json);
}
