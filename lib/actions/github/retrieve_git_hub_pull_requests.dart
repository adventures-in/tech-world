library retrieve_git_hub_pull_requests;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'retrieve_git_hub_pull_requests.g.dart';

abstract class RetrieveGitHubPullRequests extends Object
    with ReduxAction
    implements
        Built<RetrieveGitHubPullRequests, RetrieveGitHubPullRequestsBuilder> {
  RetrieveGitHubPullRequests._();

  factory RetrieveGitHubPullRequests() = _$RetrieveGitHubPullRequests._;

  factory RetrieveGitHubPullRequests.by(
          [void Function(RetrieveGitHubPullRequestsBuilder) updates]) =
      _$RetrieveGitHubPullRequests;

  Object toJson() =>
      serializers.serializeWith(RetrieveGitHubPullRequests.serializer, this);

  static RetrieveGitHubPullRequests fromJson(String jsonString) =>
      serializers.deserializeWith(
          RetrieveGitHubPullRequests.serializer, json.decode(jsonString));

  static Serializer<RetrieveGitHubPullRequests> get serializer =>
      _$retrieveGitHubPullRequestsSerializer;

  @override
  String toString() => 'RETRIEVE_GIT_HUB_PULL_REQUESTS';
}
