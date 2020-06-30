library store_nav_bar_selection;

import 'dart:convert';

import 'package:adventures_in/enums/nav_bar_selection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in/actions/redux_action.dart';
import 'package:adventures_in/models/app/serializers.dart';

part 'store_nav_bar_selection.g.dart';

abstract class StoreNavBarSelection extends Object
    with ReduxAction
    implements Built<StoreNavBarSelection, StoreNavBarSelectionBuilder> {
  StoreNavBarSelection._();
  NavBarSelection get selection;

  factory StoreNavBarSelection(
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
