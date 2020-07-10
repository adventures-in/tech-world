library connect_auth_state;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'connect_auth_state.g.dart';

abstract class ConnectAuthState extends Object
    with ReduxAction
    implements Built<ConnectAuthState, ConnectAuthStateBuilder> {
  ConnectAuthState._();

  factory ConnectAuthState() = _$ConnectAuthState._;

  factory ConnectAuthState.by(
      [void Function(ConnectAuthStateBuilder) updates]) = _$ConnectAuthState;

  Object toJson() =>
      serializers.serializeWith(ConnectAuthState.serializer, this);

  static ConnectAuthState fromJson(String jsonString) => serializers
      .deserializeWith(ConnectAuthState.serializer, json.decode(jsonString));

  static Serializer<ConnectAuthState> get serializer =>
      _$connectAuthStateSerializer;

  @override
  String toString() => 'CONNECT_AUTH_STATE';
}
