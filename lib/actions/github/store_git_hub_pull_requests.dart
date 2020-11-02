library store_git_hub_pull_requests;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_pull_request.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'store_git_hub_pull_requests.g.dart';

abstract class StoreGitHubPullRequests extends Object
    with ReduxAction
    implements Built<StoreGitHubPullRequests, StoreGitHubPullRequestsBuilder> {
  BuiltList<GitHubPullRequest> get prs;

  StoreGitHubPullRequests._();

  factory StoreGitHubPullRequests(
          {@required BuiltList<GitHubPullRequest> prs}) =
      _$StoreGitHubPullRequests._;

  factory StoreGitHubPullRequests.by(
          [void Function(StoreGitHubPullRequestsBuilder) updates]) =
      _$StoreGitHubPullRequests;

  Object toJson() =>
      serializers.serializeWith(StoreGitHubPullRequests.serializer, this);

  static StoreGitHubPullRequests fromJson(String jsonString) =>
      serializers.deserializeWith(
          StoreGitHubPullRequests.serializer, json.decode(jsonString));

  static Serializer<StoreGitHubPullRequests> get serializer =>
      _$storeGitHubPullRequestsSerializer;

  @override
  String toString() => 'STORE_GIT_HUB_PULL_REQUESTS';
}
