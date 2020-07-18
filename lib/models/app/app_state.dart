library app_state;

import 'dart:convert';

import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/nav_selection.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:adventures_in_tech_world/models/app/settings.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_issue.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_pull_request.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:adventures_in_tech_world/models/problems/problem.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  /// Problems
  BuiltList<Problem> get problems;
  bool get displayingProblem;

  /// Settings
  Settings get settings;

  /// Auth
  AuthState get authState;
  AuthStep get authStep;
  @nullable
  UserData get userData;

  /// GitHub
  @nullable
  String get gitHubToken;
  BuiltList<GitHubRepository> get gitHubRepositories;
  BuiltList<GitHubIssue> get gitHubAssignedIssues;
  BuiltList<GitHubPullRequest> get gitHubPullRequests;

  /// Adventurers
  @nullable
  Adventurer get adventurer;

  /// Navigation
  NavSelection get navSelection;

  AppState._();

  factory AppState.init() => AppState((a) => a
    ..displayingProblem = false
    ..settings = Settings.initBuilder()
    ..authState = AuthState.unknown
    ..authStep = AuthStep.checking
    ..navSelection = NavSelection.projects);

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Object toJson() => serializers.serializeWith(AppState.serializer, this);

  static AppState fromJson(String jsonString) =>
      serializers.deserializeWith(AppState.serializer, json.decode(jsonString));

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
