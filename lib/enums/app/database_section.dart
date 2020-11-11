import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'database_section.g.dart';

class DatabaseSection extends EnumClass {
  static const DatabaseSection tempToken = _$tempToken;
  static const DatabaseSection profile = _$profile;
  static const DatabaseSection adventurerData = _$adventurerData;

  static const Map<DatabaseSection, int> _$indexMap = {
    tempToken: 0,
    profile: 1,
    adventurerData: 2,
  };

  const DatabaseSection._(String name) : super(name);

  int get index => _$indexMap[this];

  static BuiltSet<DatabaseSection> get values => _$values;
  static DatabaseSection valueOf(String name) => _$valueOf(name);

  static Serializer<DatabaseSection> get serializer =>
      _$databaseSectionSerializer;

  Object toJson() =>
      serializers.serializeWith(DatabaseSection.serializer, this);
}
