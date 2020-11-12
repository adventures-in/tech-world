library retrieve_git_hub_repositories;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'retrieve_git_hub_repositories.g.dart';

abstract class RetrieveGitHubRepositories extends Object
    with ReduxAction
    implements
        Built<RetrieveGitHubRepositories, RetrieveGitHubRepositoriesBuilder> {
  RetrieveGitHubRepositories._();

  factory RetrieveGitHubRepositories() = _$RetrieveGitHubRepositories._;

  factory RetrieveGitHubRepositories.by(
          [void Function(RetrieveGitHubRepositoriesBuilder) updates]) =
      _$RetrieveGitHubRepositories;

  Object toJson() =>
      serializers.serializeWith(RetrieveGitHubRepositories.serializer, this);

  static RetrieveGitHubRepositories fromJson(String jsonString) =>
      serializers.deserializeWith(
          RetrieveGitHubRepositories.serializer, json.decode(jsonString));

  static Serializer<RetrieveGitHubRepositories> get serializer =>
      _$retrieveGitHubRepositoriesSerializer;

  @override
  String toString() => 'RETRIEVE_GIT_HUB_REPOSITORIES';
}
