library problem;

import 'dart:convert';

import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'problem.g.dart';

abstract class Problem implements Built<Problem, ProblemBuilder> {
  String get errorString; // built_value won't allow dynamic
  @nullable
  String get traceString;
  @nullable
  BuiltMap<String, Object> get info;

  Problem._();

  factory Problem(
      {@required String errorString,
      String traceString,
      BuiltMap<String, Object> info}) = _$Problem._;

  factory Problem.by([void Function(ProblemBuilder) updates]) = _$Problem;

  Object toJson() => serializers.serializeWith(Problem.serializer, this);

  static Problem fromJson(String jsonString) =>
      serializers.deserializeWith(Problem.serializer, json.decode(jsonString));

  static Serializer<Problem> get serializer => _$problemSerializer;
}
