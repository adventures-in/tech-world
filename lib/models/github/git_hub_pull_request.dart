library git_hub_pull_request;

import 'dart:convert';

import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_user.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'git_hub_pull_request.g.dart';

abstract class GitHubPullRequest
    implements Built<GitHubPullRequest, GitHubPullRequestBuilder> {
  GitHubRepository get repository;
  GitHubUser get author;
  int get number;
  String get url;
  String get title;
  DateTime get updatedAt;
  bool get isDraft;
  int get comments;
  int get files;

  GitHubPullRequest._();

  factory GitHubPullRequest(
      {@required GitHubRepository repository,
      @required GitHubUser author,
      @required int number,
      @required String url,
      @required String title,
      @required DateTime updatedAt,
      @required bool isDraft,
      @required int comments,
      @required int files}) = _$GitHubPullRequest._;

  factory GitHubPullRequest.by(
      [void Function(GitHubPullRequestBuilder) updates]) = _$GitHubPullRequest;

  Object toJson() =>
      serializers.serializeWith(GitHubPullRequest.serializer, this);

  static GitHubPullRequest fromJson(String jsonString) => serializers
      .deserializeWith(GitHubPullRequest.serializer, json.decode(jsonString));

  static Serializer<GitHubPullRequest> get serializer =>
      _$gitHubPullRequestSerializer;
}
