import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'authorizing_step.g.dart';

class AuthorizingStep extends EnumClass {
  static const AuthorizingStep checking = _$checking;
  static const AuthorizingStep waitingForInput = _$waitingForInput;
  static const AuthorizingStep contacting = _$contacting;

  const AuthorizingStep._(String name) : super(name);

  static final _$indexMap = BuiltMap<AuthorizingStep, int>(
      {checking: 0, waitingForInput: 1, contacting: 2});
  int get index => _$indexMap[this];

  static BuiltSet<AuthorizingStep> get values => _$values;
  static AuthorizingStep valueOf(String name) => _$valueOf(name);

  static Serializer<AuthorizingStep> get serializer =>
      _$authorizingStepSerializer;

  Object toJson() =>
      serializers.serializeWith(AuthorizingStep.serializer, this);
}
