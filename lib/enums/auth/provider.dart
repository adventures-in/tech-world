import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'provider.g.dart';

class Provider extends EnumClass {
  static const Provider google = _$google;
  static const Provider git_hub = _$git_hub;
  static const Provider asana = _$asana;

  const Provider._(String name) : super(name);

  static final _$indexMap =
      BuiltMap<Provider, int>({google: 0, git_hub: 1, asana: 3});
  int get index => _$indexMap[this];

  static BuiltSet<Provider> get values => _$values;
  static Provider valueOf(String name) => _$valueOf(name);

  static Serializer<Provider> get serializer => _$providerSerializer;

  Object toJson() => serializers.serializeWith(Provider.serializer, this);
}
