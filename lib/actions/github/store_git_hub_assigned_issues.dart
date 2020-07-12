library store_git_hub_assigned_issues;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_issue.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'store_git_hub_assigned_issues.g.dart';

abstract class StoreGitHubAssignedIssues extends Object
    with ReduxAction
    implements
        Built<StoreGitHubAssignedIssues, StoreGitHubAssignedIssuesBuilder> {
  BuiltList<GitHubIssue> get issues;

  StoreGitHubAssignedIssues._();

  factory StoreGitHubAssignedIssues({@required BuiltList<GitHubIssue> issues}) =
      _$StoreGitHubAssignedIssues._;

  factory StoreGitHubAssignedIssues.by(
          [void Function(StoreGitHubAssignedIssuesBuilder) updates]) =
      _$StoreGitHubAssignedIssues;

  Object toJson() =>
      serializers.serializeWith(StoreGitHubAssignedIssues.serializer, this);

  static StoreGitHubAssignedIssues fromJson(String jsonString) =>
      serializers.deserializeWith(
          StoreGitHubAssignedIssues.serializer, json.decode(jsonString));

  static Serializer<StoreGitHubAssignedIssues> get serializer =>
      _$storeGitHubAssignedIssuesSerializer;

  @override
  String toString() => 'STORE_GIT_HUB_ASSIGNED_ISSUES';
}
