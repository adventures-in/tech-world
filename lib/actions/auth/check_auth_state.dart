library check_auth_state;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in/actions/redux_action.dart';
import 'package:adventures_in/models/app/serializers.dart';

part 'check_auth_state.g.dart';

abstract class CheckAuthState extends Object
    with ReduxAction
    implements Built<CheckAuthState, CheckAuthStateBuilder> {
  CheckAuthState._();

  factory CheckAuthState([void Function(CheckAuthStateBuilder) updates]) =
      _$CheckAuthState;

  Object toJson() => serializers.serializeWith(CheckAuthState.serializer, this);

  static CheckAuthState fromJson(String jsonString) => serializers
      .deserializeWith(CheckAuthState.serializer, json.decode(jsonString));

  static Serializer<CheckAuthState> get serializer =>
      _$checkAuthStateSerializer;

  @override
  String toString() => 'CHECK_AUTH_STATE';
}
