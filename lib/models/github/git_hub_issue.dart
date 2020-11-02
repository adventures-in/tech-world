library git_hub_issue;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_label.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_user.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'git_hub_issue.g.dart';

abstract class GitHubIssue extends Object
    with ReduxAction
    implements Built<GitHubIssue, GitHubIssueBuilder> {
  GitHubUser get repoOwner;
  int get number;
  String get url;
  String get title;
  GitHubUser get author;
  BuiltList<GitHubLabel> get labels;
  int get comments;

  GitHubIssue._();

  factory GitHubIssue({
    @required GitHubUser repoOwner,
    @required int number,
    @required String url,
    @required String title,
    @required GitHubUser author,
    @required BuiltList<GitHubLabel> labels,
    @required int comments,
  }) = _$GitHubIssue._;

  factory GitHubIssue.by([void Function(GitHubIssueBuilder) updates]) =
      _$GitHubIssue;

  Object toJson() => serializers.serializeWith(GitHubIssue.serializer, this);

  static GitHubIssue fromJson(String jsonString) => serializers.deserializeWith(
      GitHubIssue.serializer, json.decode(jsonString));

  static Serializer<GitHubIssue> get serializer => _$gitHubIssueSerializer;

  @override
  String toString() => 'GIT_HUB_ISSUE';
}
