library app_state;

import 'dart:convert';

import 'package:adventures_in/enums/nav_bar_selection.dart';
import 'package:adventures_in/models/app/problem.dart';
import 'package:adventures_in/models/app/serializers.dart';
import 'package:adventures_in/models/app/settings.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<Problem> get problems;
  bool get displayingProblem;
  Settings get settings;
  NavBarSelection get navBarSelection;

  AppState._();

  factory AppState.init() => AppState((a) => a
    ..displayingProblem = false
    ..settings = Settings.initBuilder()
    ..navBarSelection = NavBarSelection.projects);

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Object toJson() => serializers.serializeWith(AppState.serializer, this);

  static AppState fromJson(String jsonString) =>
      serializers.deserializeWith(AppState.serializer, json.decode(jsonString));

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
