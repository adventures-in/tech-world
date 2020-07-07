library sign_in_with_git_hub;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_in_with_git_hub.g.dart';

abstract class SignInWithGitHub extends Object
    with ReduxAction
    implements Built<SignInWithGitHub, SignInWithGitHubBuilder> {
  SignInWithGitHub._();

  factory SignInWithGitHub() = _$SignInWithGitHub._;

  factory SignInWithGitHub.by(
      [void Function(SignInWithGitHubBuilder) updates]) = _$SignInWithGitHub;

  Object toJson() =>
      serializers.serializeWith(SignInWithGitHub.serializer, this);

  static SignInWithGitHub fromJson(String jsonString) => serializers
      .deserializeWith(SignInWithGitHub.serializer, json.decode(jsonString));

  static Serializer<SignInWithGitHub> get serializer =>
      _$signInWithGitHubSerializer;

  @override
  String toString() => 'SIGN_IN_WITH_GIT_HUB';
}
