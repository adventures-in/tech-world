// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'problems',
      serializers.serialize(object.problems,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Problem)])),
      'displayingProblem',
      serializers.serialize(object.displayingProblem,
          specifiedType: const FullType(bool)),
      'settings',
      serializers.serialize(object.settings,
          specifiedType: const FullType(Settings)),
      'navBarSelection',
      serializers.serialize(object.navBarSelection,
          specifiedType: const FullType(NavBarSelection)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'problems':
          result.problems.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Problem)]))
              as BuiltList<Object>);
          break;
        case 'displayingProblem':
          result.displayingProblem = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'settings':
          result.settings.replace(serializers.deserialize(value,
              specifiedType: const FullType(Settings)) as Settings);
          break;
        case 'navBarSelection':
          result.navBarSelection = serializers.deserialize(value,
                  specifiedType: const FullType(NavBarSelection))
              as NavBarSelection;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<Problem> problems;
  @override
  final bool displayingProblem;
  @override
  final Settings settings;
  @override
  final NavBarSelection navBarSelection;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.problems,
      this.displayingProblem,
      this.settings,
      this.navBarSelection})
      : super._() {
    if (problems == null) {
      throw new BuiltValueNullFieldError('AppState', 'problems');
    }
    if (displayingProblem == null) {
      throw new BuiltValueNullFieldError('AppState', 'displayingProblem');
    }
    if (settings == null) {
      throw new BuiltValueNullFieldError('AppState', 'settings');
    }
    if (navBarSelection == null) {
      throw new BuiltValueNullFieldError('AppState', 'navBarSelection');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        problems == other.problems &&
        displayingProblem == other.displayingProblem &&
        settings == other.settings &&
        navBarSelection == other.navBarSelection;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, problems.hashCode), displayingProblem.hashCode),
            settings.hashCode),
        navBarSelection.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('problems', problems)
          ..add('displayingProblem', displayingProblem)
          ..add('settings', settings)
          ..add('navBarSelection', navBarSelection))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<Problem> _problems;
  ListBuilder<Problem> get problems =>
      _$this._problems ??= new ListBuilder<Problem>();
  set problems(ListBuilder<Problem> problems) => _$this._problems = problems;

  bool _displayingProblem;
  bool get displayingProblem => _$this._displayingProblem;
  set displayingProblem(bool displayingProblem) =>
      _$this._displayingProblem = displayingProblem;

  SettingsBuilder _settings;
  SettingsBuilder get settings => _$this._settings ??= new SettingsBuilder();
  set settings(SettingsBuilder settings) => _$this._settings = settings;

  NavBarSelection _navBarSelection;
  NavBarSelection get navBarSelection => _$this._navBarSelection;
  set navBarSelection(NavBarSelection navBarSelection) =>
      _$this._navBarSelection = navBarSelection;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _problems = _$v.problems?.toBuilder();
      _displayingProblem = _$v.displayingProblem;
      _settings = _$v.settings?.toBuilder();
      _navBarSelection = _$v.navBarSelection;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              problems: problems.build(),
              displayingProblem: displayingProblem,
              settings: settings.build(),
              navBarSelection: navBarSelection);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'problems';
        problems.build();

        _$failedField = 'settings';
        settings.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
