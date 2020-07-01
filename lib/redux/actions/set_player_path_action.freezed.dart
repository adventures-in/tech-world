// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_player_path_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetPlayerPathAction _$SetPlayerPathActionFromJson(Map<String, dynamic> json) {
  return _SetPlayerPathAction.fromJson(json);
}

/// @nodoc
class _$SetPlayerPathActionTearOff {
  const _$SetPlayerPathActionTearOff();

  _SetPlayerPathAction call(PlayerPathMessage message) {
    return _SetPlayerPathAction(
      message,
    );
  }

  SetPlayerPathAction fromJson(Map<String, Object> json) {
    return SetPlayerPathAction.fromJson(json);
  }
}

/// @nodoc
const $SetPlayerPathAction = _$SetPlayerPathActionTearOff();

/// @nodoc
mixin _$SetPlayerPathAction {
  PlayerPathMessage get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetPlayerPathActionCopyWith<SetPlayerPathAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetPlayerPathActionCopyWith<$Res> {
  factory $SetPlayerPathActionCopyWith(
          SetPlayerPathAction value, $Res Function(SetPlayerPathAction) then) =
      _$SetPlayerPathActionCopyWithImpl<$Res>;
  $Res call({PlayerPathMessage message});

  $PlayerPathMessageCopyWith<$Res> get message;
}

/// @nodoc
class _$SetPlayerPathActionCopyWithImpl<$Res>
    implements $SetPlayerPathActionCopyWith<$Res> {
  _$SetPlayerPathActionCopyWithImpl(this._value, this._then);

  final SetPlayerPathAction _value;
  // ignore: unused_field
  final $Res Function(SetPlayerPathAction) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as PlayerPathMessage,
    ));
  }

  @override
  $PlayerPathMessageCopyWith<$Res> get message {
    return $PlayerPathMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc
abstract class _$SetPlayerPathActionCopyWith<$Res>
    implements $SetPlayerPathActionCopyWith<$Res> {
  factory _$SetPlayerPathActionCopyWith(_SetPlayerPathAction value,
          $Res Function(_SetPlayerPathAction) then) =
      __$SetPlayerPathActionCopyWithImpl<$Res>;
  @override
  $Res call({PlayerPathMessage message});

  @override
  $PlayerPathMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$SetPlayerPathActionCopyWithImpl<$Res>
    extends _$SetPlayerPathActionCopyWithImpl<$Res>
    implements _$SetPlayerPathActionCopyWith<$Res> {
  __$SetPlayerPathActionCopyWithImpl(
      _SetPlayerPathAction _value, $Res Function(_SetPlayerPathAction) _then)
      : super(_value, (v) => _then(v as _SetPlayerPathAction));

  @override
  _SetPlayerPathAction get _value => super._value as _SetPlayerPathAction;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SetPlayerPathAction(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as PlayerPathMessage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetPlayerPathAction implements _SetPlayerPathAction {
  _$_SetPlayerPathAction(this.message);

  factory _$_SetPlayerPathAction.fromJson(Map<String, dynamic> json) =>
      _$$_SetPlayerPathActionFromJson(json);

  @override
  final PlayerPathMessage message;

  @override
  String toString() {
    return 'SetPlayerPathAction(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetPlayerPathAction &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$SetPlayerPathActionCopyWith<_SetPlayerPathAction> get copyWith =>
      __$SetPlayerPathActionCopyWithImpl<_SetPlayerPathAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetPlayerPathActionToJson(this);
  }
}

abstract class _SetPlayerPathAction implements SetPlayerPathAction {
  factory _SetPlayerPathAction(PlayerPathMessage message) =
      _$_SetPlayerPathAction;

  factory _SetPlayerPathAction.fromJson(Map<String, dynamic> json) =
      _$_SetPlayerPathAction.fromJson;

  @override
  PlayerPathMessage get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SetPlayerPathActionCopyWith<_SetPlayerPathAction> get copyWith =>
      throw _privateConstructorUsedError;
}
