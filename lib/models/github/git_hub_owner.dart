library git_hub_owner;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:meta/meta.dart';

part 'git_hub_owner.g.dart';

abstract class GitHubOwner extends Object
    with ReduxAction
    implements Built<GitHubOwner, GitHubOwnerBuilder> {
  String get login;
  String get avatarUrl;

  GitHubOwner._();

  factory GitHubOwner({@required String login, @required String avatarUrl}) =
      _$GitHubOwner._;

  factory GitHubOwner.by([void Function(GitHubOwnerBuilder) updates]) =
      _$GitHubOwner;

  Object toJson() => serializers.serializeWith(GitHubOwner.serializer, this);

  static GitHubOwner fromJson(String jsonString) => serializers.deserializeWith(
      GitHubOwner.serializer, json.decode(jsonString));

  static Serializer<GitHubOwner> get serializer => _$gitHubOwnerSerializer;

  @override
  String toString() => 'GIT_HUB_OWNER';
}
