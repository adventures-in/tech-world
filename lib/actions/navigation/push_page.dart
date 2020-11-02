library push_page;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/navigation/page_data.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'push_page.g.dart';

abstract class PushPage extends Object
    with ReduxAction
    implements Built<PushPage, PushPageBuilder> {
  PageData get data;

  PushPage._();

  factory PushPage({@required PageData data}) = _$PushPage._;

  factory PushPage.by([void Function(PushPageBuilder) updates]) = _$PushPage;

  Object toJson() => serializers.serializeWith(PushPage.serializer, this);

  static PushPage fromJson(String jsonString) =>
      serializers.deserializeWith(PushPage.serializer, json.decode(jsonString));

  static Serializer<PushPage> get serializer => _$pushPageSerializer;

  @override
  String toString() => 'PUSH_PAGE';
}
