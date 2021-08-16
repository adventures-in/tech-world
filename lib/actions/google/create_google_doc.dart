library create_google_doc;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'create_google_doc.g.dart';

abstract class CreateGoogleDoc extends Object
    with ReduxAction
    implements Built<CreateGoogleDoc, CreateGoogleDocBuilder> {
  String get name;

  CreateGoogleDoc._();

  factory CreateGoogleDoc({@required String name}) = _$CreateGoogleDoc._;

  factory CreateGoogleDoc.by([void Function(CreateGoogleDocBuilder) updates]) =
      _$CreateGoogleDoc;

  Object toJson() =>
      serializers.serializeWith(CreateGoogleDoc.serializer, this);

  static CreateGoogleDoc fromJson(String jsonString) => serializers
      .deserializeWith(CreateGoogleDoc.serializer, json.decode(jsonString));

  static Serializer<CreateGoogleDoc> get serializer =>
      _$createGoogleDocSerializer;

  @override
  String toString() => 'CREATE_GOOGLE_DOC';
}
