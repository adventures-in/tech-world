// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call(
      {required AuthState auth,
      @PageDataConverter() required IList<PageData> pages,
      required IList<ProblemInfo> problems,
      required Settings settings,
      ProfileData? profile,
      required GameState game}) {
    return _AppState(
      auth: auth,
      pages: pages,
      problems: problems,
      settings: settings,
      profile: profile,
      game: game,
    );
  }

  AppState fromJson(Map<String, Object> json) {
    return AppState.fromJson(json);
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  /// RedFire AppState members
  AuthState get auth => throw _privateConstructorUsedError;
  @PageDataConverter()
  IList<PageData> get pages => throw _privateConstructorUsedError;
  IList<ProblemInfo> get problems => throw _privateConstructorUsedError;
  Settings get settings => throw _privateConstructorUsedError;
  ProfileData? get profile => throw _privateConstructorUsedError;

  /// Additional AppState members
  GameState get game => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {AuthState auth,
      @PageDataConverter() IList<PageData> pages,
      IList<ProblemInfo> problems,
      Settings settings,
      ProfileData? profile,
      GameState game});

  $AuthStateCopyWith<$Res> get auth;
  $SettingsCopyWith<$Res> get settings;
  $ProfileDataCopyWith<$Res>? get profile;
  $GameStateCopyWith<$Res> get game;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? auth = freezed,
    Object? pages = freezed,
    Object? problems = freezed,
    Object? settings = freezed,
    Object? profile = freezed,
    Object? game = freezed,
  }) {
    return _then(_value.copyWith(
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthState,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as IList<PageData>,
      problems: problems == freezed
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as IList<ProblemInfo>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileData?,
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as GameState,
    ));
  }

  @override
  $AuthStateCopyWith<$Res> get auth {
    return $AuthStateCopyWith<$Res>(_value.auth, (value) {
      return _then(_value.copyWith(auth: value));
    });
  }

  @override
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }

  @override
  $ProfileDataCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileDataCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }

  @override
  $GameStateCopyWith<$Res> get game {
    return $GameStateCopyWith<$Res>(_value.game, (value) {
      return _then(_value.copyWith(game: value));
    });
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AuthState auth,
      @PageDataConverter() IList<PageData> pages,
      IList<ProblemInfo> problems,
      Settings settings,
      ProfileData? profile,
      GameState game});

  @override
  $AuthStateCopyWith<$Res> get auth;
  @override
  $SettingsCopyWith<$Res> get settings;
  @override
  $ProfileDataCopyWith<$Res>? get profile;
  @override
  $GameStateCopyWith<$Res> get game;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object? auth = freezed,
    Object? pages = freezed,
    Object? problems = freezed,
    Object? settings = freezed,
    Object? profile = freezed,
    Object? game = freezed,
  }) {
    return _then(_AppState(
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthState,
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as IList<PageData>,
      problems: problems == freezed
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as IList<ProblemInfo>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileData?,
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as GameState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppState implements _AppState {
  _$_AppState(
      {required this.auth,
      @PageDataConverter() required this.pages,
      required this.problems,
      required this.settings,
      this.profile,
      required this.game});

  factory _$_AppState.fromJson(Map<String, dynamic> json) =>
      _$$_AppStateFromJson(json);

  @override

  /// RedFire AppState members
  final AuthState auth;
  @override
  @PageDataConverter()
  final IList<PageData> pages;
  @override
  final IList<ProblemInfo> problems;
  @override
  final Settings settings;
  @override
  final ProfileData? profile;
  @override

  /// Additional AppState members
  final GameState game;

  @override
  String toString() {
    return 'AppState(auth: $auth, pages: $pages, problems: $problems, settings: $settings, profile: $profile, game: $game)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.auth, auth) ||
                const DeepCollectionEquality().equals(other.auth, auth)) &&
            (identical(other.pages, pages) ||
                const DeepCollectionEquality().equals(other.pages, pages)) &&
            (identical(other.problems, problems) ||
                const DeepCollectionEquality()
                    .equals(other.problems, problems)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality()
                    .equals(other.profile, profile)) &&
            (identical(other.game, game) ||
                const DeepCollectionEquality().equals(other.game, game)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(auth) ^
      const DeepCollectionEquality().hash(pages) ^
      const DeepCollectionEquality().hash(problems) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(profile) ^
      const DeepCollectionEquality().hash(game);

  @JsonKey(ignore: true)
  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppStateToJson(this);
  }
}

abstract class _AppState implements AppState {
  factory _AppState(
      {required AuthState auth,
      @PageDataConverter() required IList<PageData> pages,
      required IList<ProblemInfo> problems,
      required Settings settings,
      ProfileData? profile,
      required GameState game}) = _$_AppState;

  factory _AppState.fromJson(Map<String, dynamic> json) = _$_AppState.fromJson;

  @override

  /// RedFire AppState members
  AuthState get auth => throw _privateConstructorUsedError;
  @override
  @PageDataConverter()
  IList<PageData> get pages => throw _privateConstructorUsedError;
  @override
  IList<ProblemInfo> get problems => throw _privateConstructorUsedError;
  @override
  Settings get settings => throw _privateConstructorUsedError;
  @override
  ProfileData? get profile => throw _privateConstructorUsedError;
  @override

  /// Additional AppState members
  GameState get game => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
