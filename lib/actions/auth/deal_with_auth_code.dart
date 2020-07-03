library deal_with_auth_code;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in/actions/redux_action.dart';
import 'package:adventures_in/models/app/serializers.dart';

part 'deal_with_auth_code.g.dart';

abstract class DealWithAuthCode extends Object
    with ReduxAction
    implements Built<DealWithAuthCode, DealWithAuthCodeBuilder> {
  Map<String, String> get queryParameters;

  DealWithAuthCode._();

  factory DealWithAuthCode({Map<String, String> queryParameters}) =
      _$DealWithAuthCode._;

  factory DealWithAuthCode.by(
      [void Function(DealWithAuthCodeBuilder) updates]) = _$DealWithAuthCode;

  Object toJson() =>
      serializers.serializeWith(DealWithAuthCode.serializer, this);

  static DealWithAuthCode fromJson(String jsonString) => serializers
      .deserializeWith(DealWithAuthCode.serializer, json.decode(jsonString));

  static Serializer<DealWithAuthCode> get serializer =>
      _$dealWithAuthCodeSerializer;

  @override
  String toString() =>
      'DEAL_WITH_AUTH_CODE ${(queryParameters['code'] == null) ? '(none)' : ''}';
}
