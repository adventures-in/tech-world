import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/enums/nav_bar_enum.dart';

part 'store_nav_bar_selection.freezed.dart';
part 'store_nav_bar_selection.g.dart';

@freezed
class StoreNavBarSelection with _$StoreNavBarSelection, ReduxAction {
  factory StoreNavBarSelection(NavBarEnum selection) = _StoreNavBarSelection;

  factory StoreNavBarSelection.fromJson(Map<String, Object?> json) =>
      _$StoreNavBarSelectionFromJson(json);
}
