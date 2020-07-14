library retrieve_git_hub_assigned_issues;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'retrieve_git_hub_assigned_issues.g.dart';

abstract class RetrieveGitHubAssignedIssues extends Object
    with
        ReduxAction
    implements
        Built<RetrieveGitHubAssignedIssues,
            RetrieveGitHubAssignedIssuesBuilder> {
  RetrieveGitHubAssignedIssues._();

  factory RetrieveGitHubAssignedIssues() = _$RetrieveGitHubAssignedIssues._;

  factory RetrieveGitHubAssignedIssues.by(
          [void Function(RetrieveGitHubAssignedIssuesBuilder) updates]) =
      _$RetrieveGitHubAssignedIssues;

  Object toJson() =>
      serializers.serializeWith(RetrieveGitHubAssignedIssues.serializer, this);

  static RetrieveGitHubAssignedIssues fromJson(String jsonString) =>
      serializers.deserializeWith(
          RetrieveGitHubAssignedIssues.serializer, json.decode(jsonString));

  static Serializer<RetrieveGitHubAssignedIssues> get serializer =>
      _$retrieveGitHubAssignedIssuesSerializer;

  @override
  String toString() => 'RETRIEVE_GIT_HUB_ASSIGNED_ISSUES';
}
