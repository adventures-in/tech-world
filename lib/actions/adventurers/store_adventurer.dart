library store_adventurer;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'store_adventurer.g.dart';

abstract class StoreAdventurer extends Object
    with ReduxAction
    implements Built<StoreAdventurer, StoreAdventurerBuilder> {
  Adventurer get adventurer;

  StoreAdventurer._();

  factory StoreAdventurer({@required Adventurer adventurer}) =
      _$StoreAdventurer._;

  factory StoreAdventurer.by([void Function(StoreAdventurerBuilder) updates]) =
      _$StoreAdventurer;

  Object toJson() =>
      serializers.serializeWith(StoreAdventurer.serializer, this);

  static StoreAdventurer fromJson(String jsonString) => serializers
      .deserializeWith(StoreAdventurer.serializer, json.decode(jsonString));

  static Serializer<StoreAdventurer> get serializer =>
      _$storeAdventurerSerializer;

  @override
  String toString() => 'STORE_ADVENTURER';
}
