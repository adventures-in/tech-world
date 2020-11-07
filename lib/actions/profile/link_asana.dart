library link_asana;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'link_asana.g.dart';

abstract class LinkAsana extends Object
    with ReduxAction
    implements Built<LinkAsana, LinkAsanaBuilder> {
  LinkAsana._();

  factory LinkAsana() = _$LinkAsana._;

  Object toJson() => serializers.serializeWith(LinkAsana.serializer, this);

  static LinkAsana fromJson(String jsonString) => serializers.deserializeWith(
      LinkAsana.serializer, json.decode(jsonString));

  static Serializer<LinkAsana> get serializer => _$linkAsanaSerializer;

  @override
  String toString() => 'LINK_ASANA';
}
