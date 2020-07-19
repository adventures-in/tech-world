library connect_auth_state_to_store;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'connect_auth_state_to_store.g.dart';

abstract class ConnectAuthStateToStore extends Object
    with ReduxAction
    implements Built<ConnectAuthStateToStore, ConnectAuthStateToStoreBuilder> {
  ConnectAuthStateToStore._();

  factory ConnectAuthStateToStore() = _$ConnectAuthStateToStore._;

  factory ConnectAuthStateToStore.by(
          [void Function(ConnectAuthStateToStoreBuilder) updates]) =
      _$ConnectAuthStateToStore;

  Object toJson() =>
      serializers.serializeWith(ConnectAuthStateToStore.serializer, this);

  static ConnectAuthStateToStore fromJson(String jsonString) =>
      serializers.deserializeWith(
          ConnectAuthStateToStore.serializer, json.decode(jsonString));

  static Serializer<ConnectAuthStateToStore> get serializer =>
      _$connectAuthStateToStoreSerializer;

  @override
  String toString() => 'CONNECT_AUTH_STATE_TO_STORE';
}
