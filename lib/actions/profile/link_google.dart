library link_google;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'link_google.g.dart';

abstract class LinkGoogle extends Object
    with ReduxAction
    implements Built<LinkGoogle, LinkGoogleBuilder> {
  LinkGoogle._();

  factory LinkGoogle() = _$LinkGoogle._;

  Object toJson() => serializers.serializeWith(LinkGoogle.serializer, this);

  static LinkGoogle fromJson(String jsonString) => serializers.deserializeWith(
      LinkGoogle.serializer, json.decode(jsonString));

  static Serializer<LinkGoogle> get serializer => _$linkGoogleSerializer;

  @override
  String toString() => 'LINK_GOOGLE';
}
