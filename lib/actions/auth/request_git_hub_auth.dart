library request_git_hub_auth;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'request_git_hub_auth.g.dart';

abstract class RequestGitHubAuth extends Object
    with ReduxAction
    implements Built<RequestGitHubAuth, RequestGitHubAuthBuilder> {
  RequestGitHubAuth._();

  factory RequestGitHubAuth() = _$RequestGitHubAuth._;

  factory RequestGitHubAuth.by(
      [void Function(RequestGitHubAuthBuilder) updates]) = _$RequestGitHubAuth;

  Object toJson() =>
      serializers.serializeWith(RequestGitHubAuth.serializer, this);

  static RequestGitHubAuth fromJson(String jsonString) => serializers
      .deserializeWith(RequestGitHubAuth.serializer, json.decode(jsonString));

  static Serializer<RequestGitHubAuth> get serializer =>
      _$requestGitHubAuthSerializer;

  @override
  String toString() => 'REQUEST_GIT_HUB_AUTH';
}
