library request_authorization;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'request_authorization.g.dart';

abstract class RequestAuthorization extends Object
    with ReduxAction
    implements Built<RequestAuthorization, RequestAuthorizationBuilder> {
  Provider get provider;

  RequestAuthorization._();

  factory RequestAuthorization({@required Provider provider}) =
      _$RequestAuthorization._;

  factory RequestAuthorization.by(
          [void Function(RequestAuthorizationBuilder) updates]) =
      _$RequestAuthorization;

  Object toJson() =>
      serializers.serializeWith(RequestAuthorization.serializer, this);

  static RequestAuthorization fromJson(String jsonString) =>
      serializers.deserializeWith(
          RequestAuthorization.serializer, json.decode(jsonString));

  static Serializer<RequestAuthorization> get serializer =>
      _$requestAuthorizationSerializer;

  @override
  String toString() => 'REQUEST_AUTHORIZATION';
}
