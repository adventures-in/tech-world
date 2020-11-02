library plumb_services;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'plumb_services.g.dart';

abstract class PlumbServices extends Object
    with ReduxAction
    implements Built<PlumbServices, PlumbServicesBuilder> {
  PlumbServices._();

  factory PlumbServices() = _$PlumbServices._;

  factory PlumbServices.by([void Function(PlumbServicesBuilder) updates]) =
      _$PlumbServices;

  Object toJson() => serializers.serializeWith(PlumbServices.serializer, this);

  static PlumbServices fromJson(String jsonString) => serializers
      .deserializeWith(PlumbServices.serializer, json.decode(jsonString));

  static Serializer<PlumbServices> get serializer => _$plumbServicesSerializer;

  @override
  String toString() => 'PLUMB_SERVICES';
}
