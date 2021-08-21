import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:web_socket_game_server_types/web_socket_game_server_types.dart';

part 'store_present_list_action.freezed.dart';
part 'store_present_list_action.g.dart';

@freezed
class StorePresentListAction with _$StorePresentListAction, ReduxAction {
  factory StorePresentListAction(PresentList presentList) =
      _StorePresentListAction;

  factory StorePresentListAction.fromJson(Map<String, Object?> json) =>
      _$StorePresentListActionFromJson(json);
}
