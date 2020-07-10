library store_auth_state;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'store_auth_state.g.dart';

abstract class StoreAuthState extends Object
    with ReduxAction
    implements Built<StoreAuthState, StoreAuthStateBuilder> {
  AuthState get state;

  StoreAuthState._();

  factory StoreAuthState({@required AuthState state}) = _$StoreAuthState._;

  factory StoreAuthState.by([void Function(StoreAuthStateBuilder) updates]) =
      _$StoreAuthState;

  Object toJson() => serializers.serializeWith(StoreAuthState.serializer, this);

  static StoreAuthState fromJson(String jsonString) => serializers
      .deserializeWith(StoreAuthState.serializer, json.decode(jsonString));

  static Serializer<StoreAuthState> get serializer =>
      _$storeAuthStateSerializer;

  @override
  String toString() => 'STORE_AUTH_STATE: $state';
}
