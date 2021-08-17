import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/models/adventurers/adventurer.dart';

part 'store_adventurer.freezed.dart';
part 'store_adventurer.g.dart';

@freezed
class StoreAdventurer with _$StoreAdventurer, ReduxAction {
  factory StoreAdventurer(Adventurer adventurer) = _StoreAdventurer;

  factory StoreAdventurer.fromJson(Map<String, Object?> json) =>
      _$StoreAdventurerFromJson(json);
}
