import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'linking_step.g.dart';

class LinkingStep extends EnumClass {
  static const LinkingStep contacting = _$contacting;
  static const LinkingStep linking = _$linking;

  const LinkingStep._(String name) : super(name);

  static final _$indexMap =
      BuiltMap<LinkingStep, int>({contacting: 0, linking: 1});
  int get index => _$indexMap[this];

  static BuiltSet<LinkingStep> get values => _$values;
  static LinkingStep valueOf(String name) => _$valueOf(name);

  static Serializer<LinkingStep> get serializer => _$linkingStepSerializer;

  Object toJson() => serializers.serializeWith(LinkingStep.serializer, this);
}
