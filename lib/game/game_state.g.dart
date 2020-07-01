// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameState _$$_GameStateFromJson(Map<String, dynamic> json) => _$_GameState(
      barriers: Barriers.fromJson(json['barriers'] as Map<String, dynamic>),
      otherPlayerIds:
          ISet.fromJson(json['otherPlayerIds'], (value) => value as String),
      playerPaths: IMap.fromJson(
          json['playerPaths'] as Map<String, dynamic>,
          (value) => value as String,
          (value) => IList.fromJson(value,
              (value) => Double2.fromJson(value as Map<String, dynamic>))),
    );

Map<String, dynamic> _$$_GameStateToJson(_$_GameState instance) =>
    <String, dynamic>{
      'barriers': instance.barriers.toJson(),
      'otherPlayerIds': instance.otherPlayerIds.toJson(
        (value) => value,
      ),
      'playerPaths': instance.playerPaths.toJson(
        (value) => value,
        (value) => value.toJson(
          (value) => value.toJson(),
        ),
      ),
    };
