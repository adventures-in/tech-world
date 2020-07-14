library store_git_hub_repositories;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'store_git_hub_repositories.g.dart';

abstract class StoreGitHubRepositories extends Object
    with ReduxAction
    implements Built<StoreGitHubRepositories, StoreGitHubRepositoriesBuilder> {
  BuiltList<GitHubRepository> get repositories;

  StoreGitHubRepositories._();

  factory StoreGitHubRepositories(
          {@required BuiltList<GitHubRepository> repositories}) =
      _$StoreGitHubRepositories._;

  factory StoreGitHubRepositories.by(
          [void Function(StoreGitHubRepositoriesBuilder) updates]) =
      _$StoreGitHubRepositories;

  Object toJson() =>
      serializers.serializeWith(StoreGitHubRepositories.serializer, this);

  static StoreGitHubRepositories fromJson(String jsonString) =>
      serializers.deserializeWith(
          StoreGitHubRepositories.serializer, json.decode(jsonString));

  static Serializer<StoreGitHubRepositories> get serializer =>
      _$storeGitHubRepositoriesSerializer;

  @override
  String toString() => 'STORE_GIT_HUB_REPOSITORIES';
}
