library problem;

import 'dart:convert';

import 'package:adventures_in/enums/problem_type.dart';
import 'package:adventures_in/models/app/app_state.dart';
import 'package:adventures_in/models/app/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'problem.g.dart';

abstract class Problem implements Built<Problem, ProblemBuilder> {
  ProblemType get type;

  String get message;

  BuiltMap<String, Object> get info;

  @nullable
  String get trace;

  @nullable
  AppState get state;

  Problem._();

  factory Problem([void Function(ProblemBuilder) updates]) = _$Problem;

  Object toJson() => serializers.serializeWith(Problem.serializer, this);

  static Problem fromJson(String jsonString) =>
      serializers.deserializeWith(Problem.serializer, json.decode(jsonString));

  static Serializer<Problem> get serializer => _$problemSerializer;
}
