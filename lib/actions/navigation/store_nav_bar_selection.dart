library store_nav_bar_selection;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/nav_bar_selection.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'store_nav_bar_selection.g.dart';

abstract class StoreNavBarSelection extends Object
    with ReduxAction
    implements Built<StoreNavBarSelection, StoreNavBarSelectionBuilder> {
  NavBarSelection get selection;

  StoreNavBarSelection._();

  factory StoreNavBarSelection({@required NavBarSelection selection}) =
      _$StoreNavBarSelection._;

  factory StoreNavBarSelection.by(
          [void Function(StoreNavBarSelectionBuilder) updates]) =
      _$StoreNavBarSelection;

  Object toJson() =>
      serializers.serializeWith(StoreNavBarSelection.serializer, this);

  static StoreNavBarSelection fromJson(String jsonString) =>
      serializers.deserializeWith(
          StoreNavBarSelection.serializer, json.decode(jsonString));

  static Serializer<StoreNavBarSelection> get serializer =>
      _$storeNavBarSelectionSerializer;

  @override
  String toString() => 'STORE_NAV_BAR_SELECTION';
}
