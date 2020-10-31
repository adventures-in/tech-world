library remove_problem;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/problems/problem.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'remove_problem.g.dart';

abstract class RemoveProblem extends Object
    with ReduxAction
    implements Built<RemoveProblem, RemoveProblemBuilder> {
  Problem get problem;

  RemoveProblem._();

  factory RemoveProblem({Problem problem}) = _$RemoveProblem._;

  factory RemoveProblem.by([void Function(RemoveProblemBuilder) updates]) =
      _$RemoveProblem;

  Object toJson() => serializers.serializeWith(RemoveProblem.serializer, this);

  static RemoveProblem fromJson(String jsonString) => serializers
      .deserializeWith(RemoveProblem.serializer, json.decode(jsonString));

  static Serializer<RemoveProblem> get serializer => _$removeProblemSerializer;

  @override
  String toString() => 'REMOVE_PROBLEM';
}
