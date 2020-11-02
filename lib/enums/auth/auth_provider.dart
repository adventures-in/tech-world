import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_provider.g.dart';

class AuthProvider extends EnumClass {
  static Serializer<AuthProvider> get serializer => _$authProviderSerializer;
  static const AuthProvider gitHub = _$gitHub;
  static const AuthProvider firebase = _$firebase;
  static const Map<AuthProvider, int> _$indexMap = {gitHub: 0, firebase: 1};
  static const Map<AuthProvider, String> _$idMap = {
    gitHub: 'github.com',
    firebase: 'firebase'
  };

  const AuthProvider._(String name) : super(name);

  int get index => _$indexMap[this];
  String get id => _$idMap[this];
  static BuiltSet<AuthProvider> get values => _$values;
  static AuthProvider valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(AuthProvider.serializer, this);
}
