import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_step.g.dart';

class AuthStep extends EnumClass {
  static Serializer<AuthStep> get serializer => _$authStepSerializer;
  static const AuthStep checking = _$checking;
  static const AuthStep waitingForInput = _$waitingForInput;
  static const AuthStep contactingApple = _$contactingApple;
  static const AuthStep contactingGoogle = _$contactingGoogle;
  static const AuthStep signingInWithFirebase = _$signingInWithFirebase;
  static const AuthStep signingOut = _$signingOut;

  static const Map<AuthStep, int> _$indexMap = {
    checking: 0,
    waitingForInput: 1,
    contactingApple: 2,
    contactingGoogle: 3,
    signingInWithFirebase: 4,
    signingOut: 5
  };

  const AuthStep._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<AuthStep> get values => _$values;
  static AuthStep valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(AuthStep.serializer, this);
}
