library observe_git_hub_token;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'observe_git_hub_token.g.dart';

abstract class ObserveGitHubToken extends Object
    with ReduxAction
    implements Built<ObserveGitHubToken, ObserveGitHubTokenBuilder> {
  String get uid;

  ObserveGitHubToken._();

  factory ObserveGitHubToken({@required String uid}) = _$ObserveGitHubToken._;

  factory ObserveGitHubToken.by(
          [void Function(ObserveGitHubTokenBuilder) updates]) =
      _$ObserveGitHubToken;

  Object toJson() =>
      serializers.serializeWith(ObserveGitHubToken.serializer, this);

  static ObserveGitHubToken fromJson(String jsonString) => serializers
      .deserializeWith(ObserveGitHubToken.serializer, json.decode(jsonString));

  static Serializer<ObserveGitHubToken> get serializer =>
      _$observeGitHubTokenSerializer;

  @override
  String toString() => 'OBSERVE_GIT_HUB_TOKEN';
}
