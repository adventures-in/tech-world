// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

  _GameState call(
      {required Barriers barriers,
      required ISet<String> otherPlayerIds,
      required IMap<String, IList<Double2>> playerPaths}) {
    return _GameState(
      barriers: barriers,
      otherPlayerIds: otherPlayerIds,
      playerPaths: playerPaths,
    );
  }

  GameState fromJson(Map<String, Object> json) {
    return GameState.fromJson(json);
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  Barriers get barriers => throw _privateConstructorUsedError;
  ISet<String> get otherPlayerIds => throw _privateConstructorUsedError;
  IMap<String, IList<Double2>> get playerPaths =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
  $Res call(
      {Barriers barriers,
      ISet<String> otherPlayerIds,
      IMap<String, IList<Double2>> playerPaths});

  $BarriersCopyWith<$Res> get barriers;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;

  @override
  $Res call({
    Object? barriers = freezed,
    Object? otherPlayerIds = freezed,
    Object? playerPaths = freezed,
  }) {
    return _then(_value.copyWith(
      barriers: barriers == freezed
          ? _value.barriers
          : barriers // ignore: cast_nullable_to_non_nullable
              as Barriers,
      otherPlayerIds: otherPlayerIds == freezed
          ? _value.otherPlayerIds
          : otherPlayerIds // ignore: cast_nullable_to_non_nullable
              as ISet<String>,
      playerPaths: playerPaths == freezed
          ? _value.playerPaths
          : playerPaths // ignore: cast_nullable_to_non_nullable
              as IMap<String, IList<Double2>>,
    ));
  }

  @override
  $BarriersCopyWith<$Res> get barriers {
    return $BarriersCopyWith<$Res>(_value.barriers, (value) {
      return _then(_value.copyWith(barriers: value));
    });
  }
}

/// @nodoc
abstract class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(
          _GameState value, $Res Function(_GameState) then) =
      __$GameStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Barriers barriers,
      ISet<String> otherPlayerIds,
      IMap<String, IList<Double2>> playerPaths});

  @override
  $BarriersCopyWith<$Res> get barriers;
}

/// @nodoc
class __$GameStateCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(_GameState _value, $Res Function(_GameState) _then)
      : super(_value, (v) => _then(v as _GameState));

  @override
  _GameState get _value => super._value as _GameState;

  @override
  $Res call({
    Object? barriers = freezed,
    Object? otherPlayerIds = freezed,
    Object? playerPaths = freezed,
  }) {
    return _then(_GameState(
      barriers: barriers == freezed
          ? _value.barriers
          : barriers // ignore: cast_nullable_to_non_nullable
              as Barriers,
      otherPlayerIds: otherPlayerIds == freezed
          ? _value.otherPlayerIds
          : otherPlayerIds // ignore: cast_nullable_to_non_nullable
              as ISet<String>,
      playerPaths: playerPaths == freezed
          ? _value.playerPaths
          : playerPaths // ignore: cast_nullable_to_non_nullable
              as IMap<String, IList<Double2>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameState implements _GameState {
  _$_GameState(
      {required this.barriers,
      required this.otherPlayerIds,
      required this.playerPaths});

  factory _$_GameState.fromJson(Map<String, dynamic> json) =>
      _$$_GameStateFromJson(json);

  @override
  final Barriers barriers;
  @override
  final ISet<String> otherPlayerIds;
  @override
  final IMap<String, IList<Double2>> playerPaths;

  @override
  String toString() {
    return 'GameState(barriers: $barriers, otherPlayerIds: $otherPlayerIds, playerPaths: $playerPaths)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameState &&
            (identical(other.barriers, barriers) ||
                const DeepCollectionEquality()
                    .equals(other.barriers, barriers)) &&
            (identical(other.otherPlayerIds, otherPlayerIds) ||
                const DeepCollectionEquality()
                    .equals(other.otherPlayerIds, otherPlayerIds)) &&
            (identical(other.playerPaths, playerPaths) ||
                const DeepCollectionEquality()
                    .equals(other.playerPaths, playerPaths)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(barriers) ^
      const DeepCollectionEquality().hash(otherPlayerIds) ^
      const DeepCollectionEquality().hash(playerPaths);

  @JsonKey(ignore: true)
  @override
  _$GameStateCopyWith<_GameState> get copyWith =>
      __$GameStateCopyWithImpl<_GameState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameStateToJson(this);
  }
}

abstract class _GameState implements GameState {
  factory _GameState(
      {required Barriers barriers,
      required ISet<String> otherPlayerIds,
      required IMap<String, IList<Double2>> playerPaths}) = _$_GameState;

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$_GameState.fromJson;

  @override
  Barriers get barriers => throw _privateConstructorUsedError;
  @override
  ISet<String> get otherPlayerIds => throw _privateConstructorUsedError;
  @override
  IMap<String, IList<Double2>> get playerPaths =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GameStateCopyWith<_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
