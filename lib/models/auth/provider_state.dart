library provider_state;

import 'dart:convert';

import 'package:adventures_in_tech_world/enums/auth/authorization_state.dart';
import 'package:adventures_in_tech_world/enums/auth/authorizing_step.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'provider_state.g.dart';

abstract class ProviderState
    implements Built<ProviderState, ProviderStateBuilder> {
  AuthorizingStep get step;
  AuthorizationState get state;

  ProviderState._();

  factory ProviderState(
      {@required AuthorizingStep step,
      @required AuthorizationState state}) = _$ProviderState._;

  factory ProviderState.by([void Function(ProviderStateBuilder) updates]) =
      _$ProviderState;

  Object toJson() => serializers.serializeWith(ProviderState.serializer, this);

  static ProviderState fromJson(String jsonString) => serializers
      .deserializeWith(ProviderState.serializer, json.decode(jsonString));

  static Serializer<ProviderState> get serializer => _$providerStateSerializer;
}
