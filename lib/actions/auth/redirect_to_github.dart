library redirect_to_github;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in/actions/redux_action.dart';
import 'package:adventures_in/models/app/serializers.dart';

part 'redirect_to_github.g.dart';

abstract class RedirectToGithub extends Object
    with ReduxAction
    implements Built<RedirectToGithub, RedirectToGithubBuilder> {
  RedirectToGithub._();

  factory RedirectToGithub([void Function(RedirectToGithubBuilder) updates]) =
      _$RedirectToGithub;

  Object toJson() =>
      serializers.serializeWith(RedirectToGithub.serializer, this);

  static RedirectToGithub fromJson(String jsonString) => serializers
      .deserializeWith(RedirectToGithub.serializer, json.decode(jsonString));

  static Serializer<RedirectToGithub> get serializer =>
      _$redirectToGithubSerializer;

  @override
  String toString() => 'REDIRECT_TO_GITHUB';
}
