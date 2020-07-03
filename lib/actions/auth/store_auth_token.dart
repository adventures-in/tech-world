library store_auth_token;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in/actions/redux_action.dart';
import 'package:adventures_in/models/app/serializers.dart';

part 'store_auth_token.g.dart';

abstract class StoreAuthToken extends Object
    with ReduxAction
    implements Built<StoreAuthToken, StoreAuthTokenBuilder> {
  String get token;

  StoreAuthToken._();

  factory StoreAuthToken({String token}) = _$StoreAuthToken._;

  factory StoreAuthToken.by([void Function(StoreAuthTokenBuilder) updates]) =
      _$StoreAuthToken;

  Object toJson() => serializers.serializeWith(StoreAuthToken.serializer, this);

  static StoreAuthToken fromJson(String jsonString) => serializers
      .deserializeWith(StoreAuthToken.serializer, json.decode(jsonString));

  static Serializer<StoreAuthToken> get serializer =>
      _$storeAuthTokenSerializer;

  @override
  String toString() => 'STORE_AUTH_TOKEN';
}
