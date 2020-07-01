// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_player_path_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SetPlayerPathAction _$$_SetPlayerPathActionFromJson(
        Map<String, dynamic> json) =>
    _$_SetPlayerPathAction(
      PlayerPathMessage.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SetPlayerPathActionToJson(
        _$_SetPlayerPathAction instance) =>
    <String, dynamic>{
      'message': instance.message.toJson(),
    };
