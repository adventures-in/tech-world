// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_other_player_ids_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetOtherPlayerIdsAction _$SetOtherPlayerIdsActionFromJson(
    Map<String, dynamic> json) {
  return _SetOtherPlayerIdsAction.fromJson(json);
}

/// @nodoc
class _$SetOtherPlayerIdsActionTearOff {
  const _$SetOtherPlayerIdsActionTearOff();

  _SetOtherPlayerIdsAction call(ISet<String> ids) {
    return _SetOtherPlayerIdsAction(
      ids,
    );
  }

  SetOtherPlayerIdsAction fromJson(Map<String, Object> json) {
    return SetOtherPlayerIdsAction.fromJson(json);
  }
}

/// @nodoc
const $SetOtherPlayerIdsAction = _$SetOtherPlayerIdsActionTearOff();

/// @nodoc
mixin _$SetOtherPlayerIdsAction {
  ISet<String> get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetOtherPlayerIdsActionCopyWith<SetOtherPlayerIdsAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetOtherPlayerIdsActionCopyWith<$Res> {
  factory $SetOtherPlayerIdsActionCopyWith(SetOtherPlayerIdsAction value,
          $Res Function(SetOtherPlayerIdsAction) then) =
      _$SetOtherPlayerIdsActionCopyWithImpl<$Res>;
  $Res call({ISet<String> ids});
}

/// @nodoc
class _$SetOtherPlayerIdsActionCopyWithImpl<$Res>
    implements $SetOtherPlayerIdsActionCopyWith<$Res> {
  _$SetOtherPlayerIdsActionCopyWithImpl(this._value, this._then);

  final SetOtherPlayerIdsAction _value;
  // ignore: unused_field
  final $Res Function(SetOtherPlayerIdsAction) _then;

  @override
  $Res call({
    Object? ids = freezed,
  }) {
    return _then(_value.copyWith(
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as ISet<String>,
    ));
  }
}

/// @nodoc
abstract class _$SetOtherPlayerIdsActionCopyWith<$Res>
    implements $SetOtherPlayerIdsActionCopyWith<$Res> {
  factory _$SetOtherPlayerIdsActionCopyWith(_SetOtherPlayerIdsAction value,
          $Res Function(_SetOtherPlayerIdsAction) then) =
      __$SetOtherPlayerIdsActionCopyWithImpl<$Res>;
  @override
  $Res call({ISet<String> ids});
}

/// @nodoc
class __$SetOtherPlayerIdsActionCopyWithImpl<$Res>
    extends _$SetOtherPlayerIdsActionCopyWithImpl<$Res>
    implements _$SetOtherPlayerIdsActionCopyWith<$Res> {
  __$SetOtherPlayerIdsActionCopyWithImpl(_SetOtherPlayerIdsAction _value,
      $Res Function(_SetOtherPlayerIdsAction) _then)
      : super(_value, (v) => _then(v as _SetOtherPlayerIdsAction));

  @override
  _SetOtherPlayerIdsAction get _value =>
      super._value as _SetOtherPlayerIdsAction;

  @override
  $Res call({
    Object? ids = freezed,
  }) {
    return _then(_SetOtherPlayerIdsAction(
      ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as ISet<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetOtherPlayerIdsAction implements _SetOtherPlayerIdsAction {
  _$_SetOtherPlayerIdsAction(this.ids);

  factory _$_SetOtherPlayerIdsAction.fromJson(Map<String, dynamic> json) =>
      _$$_SetOtherPlayerIdsActionFromJson(json);

  @override
  final ISet<String> ids;

  @override
  String toString() {
    return 'SetOtherPlayerIdsAction(ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetOtherPlayerIdsAction &&
            (identical(other.ids, ids) ||
                const DeepCollectionEquality().equals(other.ids, ids)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(ids);

  @JsonKey(ignore: true)
  @override
  _$SetOtherPlayerIdsActionCopyWith<_SetOtherPlayerIdsAction> get copyWith =>
      __$SetOtherPlayerIdsActionCopyWithImpl<_SetOtherPlayerIdsAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetOtherPlayerIdsActionToJson(this);
  }
}

abstract class _SetOtherPlayerIdsAction implements SetOtherPlayerIdsAction {
  factory _SetOtherPlayerIdsAction(ISet<String> ids) =
      _$_SetOtherPlayerIdsAction;

  factory _SetOtherPlayerIdsAction.fromJson(Map<String, dynamic> json) =
      _$_SetOtherPlayerIdsAction.fromJson;

  @override
  ISet<String> get ids => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SetOtherPlayerIdsActionCopyWith<_SetOtherPlayerIdsAction> get copyWith =>
      throw _privateConstructorUsedError;
}
