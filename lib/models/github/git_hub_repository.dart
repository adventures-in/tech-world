library git_hub_repository;

import 'dart:convert';

import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_user.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'git_hub_repository.g.dart';

abstract class GitHubRepository
    implements Built<GitHubRepository, GitHubRepositoryBuilder> {
  String get name;
  @nullable
  String get description;
  bool get isFork;
  bool get isPrivate;
  int get stargazers;
  String get url;
  int get issues;
  GitHubUser get owner;

  GitHubRepository._();

  factory GitHubRepository(
      {@required String name,
      @required String description,
      @required bool isFork,
      @required bool isPrivate,
      @required int stargazers,
      @required String url,
      @required int issues,
      @required GitHubUser owner}) = _$GitHubRepository._;

  factory GitHubRepository.by(
      [void Function(GitHubRepositoryBuilder) updates]) = _$GitHubRepository;

  Object toJson() =>
      serializers.serializeWith(GitHubRepository.serializer, this);

  static GitHubRepository fromJson(String jsonString) => serializers
      .deserializeWith(GitHubRepository.serializer, json.decode(jsonString));

  static Serializer<GitHubRepository> get serializer =>
      _$gitHubRepositorySerializer;
}
