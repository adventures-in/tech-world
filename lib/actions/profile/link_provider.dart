library link_provider;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'link_provider.g.dart';

abstract class LinkProvider extends Object
    with ReduxAction
    implements Built<LinkProvider, LinkProviderBuilder> {
  Provider get provider;

  LinkProvider._();

  factory LinkProvider({@required Provider provider}) = _$LinkProvider._;

  factory LinkProvider.by([void Function(LinkProviderBuilder) updates]) =
      _$LinkProvider;

  Object toJson() => serializers.serializeWith(LinkProvider.serializer, this);

  static LinkProvider fromJson(String jsonString) => serializers
      .deserializeWith(LinkProvider.serializer, json.decode(jsonString));

  static Serializer<LinkProvider> get serializer => _$linkProviderSerializer;

  @override
  String toString() => 'LINK_PROVIDER';
}
