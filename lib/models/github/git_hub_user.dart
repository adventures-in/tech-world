library git_hub_user;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'git_hub_user.g.dart';

abstract class GitHubUser extends Object
    with ReduxAction
    implements Built<GitHubUser, GitHubUserBuilder> {
  String get login;
  String get avatarUrl;

  GitHubUser._();

  factory GitHubUser({@required String login, @required String avatarUrl}) =
      _$GitHubUser._;

  factory GitHubUser.by([void Function(GitHubUserBuilder) updates]) =
      _$GitHubUser;

  Object toJson() => serializers.serializeWith(GitHubUser.serializer, this);

  static GitHubUser fromJson(String jsonString) => serializers.deserializeWith(
      GitHubUser.serializer, json.decode(jsonString));

  static Serializer<GitHubUser> get serializer => _$gitHubUserSerializer;

  @override
  String toString() => 'GIT_HUB_USER';
}
