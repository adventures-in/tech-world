import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'update_adventurer.freezed.dart';
part 'update_adventurer.g.dart';

@freezed
class UpdateAdventurer with _$UpdateAdventurer, ReduxAction {
  factory UpdateAdventurer({
    String? displayName,
    String? photoURL,
    String? firstName,
    String? lastName,
    String? gitHubToken,
    String? googleToken,
    String? asanaToken,
  }) = _UpdateAdventurer;

  factory UpdateAdventurer.fromJson(Map<String, Object?> json) =>
      _$UpdateAdventurerFromJson(json);
}
