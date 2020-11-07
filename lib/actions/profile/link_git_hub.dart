library link_git_hub;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'link_git_hub.g.dart';

abstract class LinkGitHub extends Object
    with ReduxAction
    implements Built<LinkGitHub, LinkGitHubBuilder> {
  LinkGitHub._();

  factory LinkGitHub() = _$LinkGitHub._;

  Object toJson() => serializers.serializeWith(LinkGitHub.serializer, this);

  static LinkGitHub fromJson(String jsonString) => serializers.deserializeWith(
      LinkGitHub.serializer, json.decode(jsonString));

  static Serializer<LinkGitHub> get serializer => _$linkGitHubSerializer;

  @override
  String toString() => 'LINK_GIT_HUB';
}
