library observe_auth_token;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'observe_auth_token.g.dart';

abstract class ObserveAuthToken extends Object
    with ReduxAction
    implements Built<ObserveAuthToken, ObserveAuthTokenBuilder> {
  String get userId;

  ObserveAuthToken._();

  factory ObserveAuthToken({@required String userId}) = _$ObserveAuthToken._;

  factory ObserveAuthToken.by(
      [void Function(ObserveAuthTokenBuilder) updates]) = _$ObserveAuthToken;

  Object toJson() =>
      serializers.serializeWith(ObserveAuthToken.serializer, this);

  static ObserveAuthToken fromJson(String jsonString) => serializers
      .deserializeWith(ObserveAuthToken.serializer, json.decode(jsonString));

  static Serializer<ObserveAuthToken> get serializer =>
      _$observeAuthTokenSerializer;

  @override
  String toString() => 'OBSERVE_AUTH_TOKEN';
}
