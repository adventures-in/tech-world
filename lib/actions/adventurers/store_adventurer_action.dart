import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/models/adventurers/adventurer.dart';

part 'store_adventurer_action.freezed.dart';
part 'store_adventurer_action.g.dart';

@freezed
class StoreAdventurerAction with _$StoreAdventurerAction, ReduxAction {
  factory StoreAdventurerAction(Adventurer adventurer) = _StoreAdventurerAction;

  factory StoreAdventurerAction.fromJson(Map<String, Object?> json) =>
      _$StoreAdventurerActionFromJson(json);
}
