library auth_with_git_hub;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in/actions/redux_action.dart';
import 'package:adventures_in/models/app/serializers.dart';

part 'auth_with_git_hub.g.dart';

abstract class AuthWithGitHub extends Object
    with ReduxAction
    implements Built<AuthWithGitHub, AuthWithGitHubBuilder> {
  AuthWithGitHub._();

  factory AuthWithGitHub([void Function(AuthWithGitHubBuilder) updates]) =
      _$AuthWithGitHub;

  Object toJson() => serializers.serializeWith(AuthWithGitHub.serializer, this);

  static AuthWithGitHub fromJson(String jsonString) => serializers
      .deserializeWith(AuthWithGitHub.serializer, json.decode(jsonString));

  static Serializer<AuthWithGitHub> get serializer =>
      _$authWithGitHubSerializer;

  @override
  String toString() => 'AUTH_WITH_GIT_HUB';
}
