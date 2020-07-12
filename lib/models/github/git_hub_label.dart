library git_hub_label;

import 'dart:convert';

import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'git_hub_label.g.dart';

abstract class GitHubLabel implements Built<GitHubLabel, GitHubLabelBuilder> {
  String get name;
  String get color;

  GitHubLabel._();

  factory GitHubLabel({@required String color, @required String name}) =
      _$GitHubLabel._;

  factory GitHubLabel.by([void Function(GitHubLabelBuilder) updates]) =
      _$GitHubLabel;

  Object toJson() => serializers.serializeWith(GitHubLabel.serializer, this);

  static GitHubLabel fromJson(String jsonString) => serializers.deserializeWith(
      GitHubLabel.serializer, json.decode(jsonString));

  static Serializer<GitHubLabel> get serializer => _$gitHubLabelSerializer;
}
