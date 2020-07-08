library add_problem;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/problem_type.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:adventures_in_tech_world/models/problems/problem.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'add_problem.g.dart';

abstract class AddProblem extends Object
    with ReduxAction
    implements Built<AddProblem, AddProblemBuilder> {
  ProblemType get type;
  String get errorString; // built_value won't allow dynamic
  @nullable
  String get traceString;
  @nullable
  BuiltMap<String, Object> get info;

  AddProblem._();

  factory AddProblem(
      {@required ProblemType type,
      @required String errorString,
      String traceString,
      BuiltMap<String, Object> info}) = _$AddProblem._;

  factory AddProblem.by([void Function(AddProblemBuilder) updates]) =
      _$AddProblem;

  Problem get problem => Problem(
      errorString: errorString,
      type: type,
      traceString: traceString,
      info: info);

  Object toJson() => serializers.serializeWith(AddProblem.serializer, this);

  static AddProblem fromJson(String jsonString) => serializers.deserializeWith(
      AddProblem.serializer, json.decode(jsonString));

  static Serializer<AddProblem> get serializer => _$addProblemSerializer;

  @override
  String toString() => 'ADD_PROBLEM';
}
