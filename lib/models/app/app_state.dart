library app_state;

import 'dart:convert';

import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/nav_bar_selection.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/app/problem.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:adventures_in_tech_world/models/app/settings.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<Problem> get problems;
  bool get displayingProblem;
  Settings get settings;
  AuthState get authState;
  AuthStep get authStep;
  @nullable
  String get authToken;
  @nullable
  Adventurer get adventurer;
  NavBarSelection get navBarSelection;

  AppState._();

  factory AppState.init() => AppState((a) => a
    ..displayingProblem = false
    ..settings = Settings.initBuilder()
    ..authState = AuthState.notSignedIn
    ..authStep = AuthStep.checking
    ..navBarSelection = NavBarSelection.projects);

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Object toJson() => serializers.serializeWith(AppState.serializer, this);

  static AppState fromJson(String jsonString) =>
      serializers.deserializeWith(AppState.serializer, json.decode(jsonString));

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
