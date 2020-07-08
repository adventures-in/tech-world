library store_displaying_problem;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'store_displaying_problem.g.dart';

abstract class StoreDisplayingProblem extends Object
    with ReduxAction
    implements Built<StoreDisplayingProblem, StoreDisplayingProblemBuilder> {
  bool get value;

  StoreDisplayingProblem._();

  factory StoreDisplayingProblem({@required bool value}) =
      _$StoreDisplayingProblem._;

  factory StoreDisplayingProblem.by(
          [void Function(StoreDisplayingProblemBuilder) updates]) =
      _$StoreDisplayingProblem;

  Object toJson() =>
      serializers.serializeWith(StoreDisplayingProblem.serializer, this);

  static StoreDisplayingProblem fromJson(String jsonString) =>
      serializers.deserializeWith(
          StoreDisplayingProblem.serializer, json.decode(jsonString));

  static Serializer<StoreDisplayingProblem> get serializer =>
      _$storeDisplayingProblemSerializer;

  @override
  String toString() => 'STORE_DISPLAYING_PROBLEM';
}
