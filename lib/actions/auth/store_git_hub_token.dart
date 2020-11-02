library store_git_hub_token;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'store_git_hub_token.g.dart';

abstract class StoreGitHubToken extends Object
    with ReduxAction
    implements Built<StoreGitHubToken, StoreGitHubTokenBuilder> {
  @nullable
  String get token;

  StoreGitHubToken._();

  factory StoreGitHubToken({@required String token}) = _$StoreGitHubToken._;

  factory StoreGitHubToken.by(
      [void Function(StoreGitHubTokenBuilder) updates]) = _$StoreGitHubToken;

  Object toJson() =>
      serializers.serializeWith(StoreGitHubToken.serializer, this);

  static StoreGitHubToken fromJson(String jsonString) => serializers
      .deserializeWith(StoreGitHubToken.serializer, json.decode(jsonString));

  static Serializer<StoreGitHubToken> get serializer =>
      _$storeGitHubTokenSerializer;

  @override
  String toString() {
    final tokenOutput =
        (token == null) ? 'null' : token.substring(0, 4) + '...';
    return 'STORE_GIT_HUB_TOKEN: $tokenOutput';
  }
}
