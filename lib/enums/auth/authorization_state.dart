import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authorization_state.g.dart';

class AuthorizationState extends EnumClass {
  static const AuthorizationState unkown = _$unkown;
  static const AuthorizationState notAuthorized = _$notAuthorized;
  static const AuthorizationState authorized = _$authorized;

  const AuthorizationState._(String name) : super(name);

  static final _$indexMap = BuiltMap<AuthorizationState, int>(
      {unkown: 0, notAuthorized: 1, authorized: 2});
  int get index => _$indexMap[this];

  static BuiltSet<AuthorizationState> get values => _$values;
  static AuthorizationState valueOf(String name) => _$valueOf(name);

  static Serializer<AuthorizationState> get serializer =>
      _$authorizationStateSerializer;

  Object toJson() =>
      serializers.serializeWith(AuthorizationState.serializer, this);
}
