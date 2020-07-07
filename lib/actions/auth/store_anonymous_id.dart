library store_anonymous_id;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'store_anonymous_id.g.dart';

abstract class StoreAnonymousId extends Object
    with ReduxAction
    implements Built<StoreAnonymousId, StoreAnonymousIdBuilder> {
  String get id;

  StoreAnonymousId._();

  factory StoreAnonymousId({String id}) = _$StoreAnonymousId._;

  factory StoreAnonymousId.by(
      [void Function(StoreAnonymousIdBuilder) updates]) = _$StoreAnonymousId;

  Object toJson() =>
      serializers.serializeWith(StoreAnonymousId.serializer, this);

  static StoreAnonymousId fromJson(String jsonString) => serializers
      .deserializeWith(StoreAnonymousId.serializer, json.decode(jsonString));

  static Serializer<StoreAnonymousId> get serializer =>
      _$storeAnonymousIdSerializer;

  @override
  String toString() => 'STORE_ANONYMOUS_ID';
}
