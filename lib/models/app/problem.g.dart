// GENERATED CODE - DO NOT MODIFY BY HAND

part of problem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Problem> _$problemSerializer = new _$ProblemSerializer();

class _$ProblemSerializer implements StructuredSerializer<Problem> {
  @override
  final Iterable<Type> types = const [Problem, _$Problem];
  @override
  final String wireName = 'Problem';

  @override
  Iterable<Object> serialize(Serializers serializers, Problem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(ProblemType)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'info',
      serializers.serialize(object.info,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(Object)])),
    ];
    if (object.trace != null) {
      result
        ..add('trace')
        ..add(serializers.serialize(object.trace,
            specifiedType: const FullType(String)));
    }
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(AppState)));
    }
    return result;
  }

  @override
  Problem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProblemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(ProblemType)) as ProblemType;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'info':
          result.info.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Object)])));
          break;
        case 'trace':
          result.trace = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppState)) as AppState);
          break;
      }
    }

    return result.build();
  }
}

class _$Problem extends Problem {
  @override
  final ProblemType type;
  @override
  final String message;
  @override
  final BuiltMap<String, Object> info;
  @override
  final String trace;
  @override
  final AppState state;

  factory _$Problem([void Function(ProblemBuilder) updates]) =>
      (new ProblemBuilder()..update(updates)).build();

  _$Problem._({this.type, this.message, this.info, this.trace, this.state})
      : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('Problem', 'type');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('Problem', 'message');
    }
    if (info == null) {
      throw new BuiltValueNullFieldError('Problem', 'info');
    }
  }

  @override
  Problem rebuild(void Function(ProblemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProblemBuilder toBuilder() => new ProblemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Problem &&
        type == other.type &&
        message == other.message &&
        info == other.info &&
        trace == other.trace &&
        state == other.state;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, type.hashCode), message.hashCode), info.hashCode),
            trace.hashCode),
        state.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Problem')
          ..add('type', type)
          ..add('message', message)
          ..add('info', info)
          ..add('trace', trace)
          ..add('state', state))
        .toString();
  }
}

class ProblemBuilder implements Builder<Problem, ProblemBuilder> {
  _$Problem _$v;

  ProblemType _type;
  ProblemType get type => _$this._type;
  set type(ProblemType type) => _$this._type = type;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  MapBuilder<String, Object> _info;
  MapBuilder<String, Object> get info =>
      _$this._info ??= new MapBuilder<String, Object>();
  set info(MapBuilder<String, Object> info) => _$this._info = info;

  String _trace;
  String get trace => _$this._trace;
  set trace(String trace) => _$this._trace = trace;

  AppStateBuilder _state;
  AppStateBuilder get state => _$this._state ??= new AppStateBuilder();
  set state(AppStateBuilder state) => _$this._state = state;

  ProblemBuilder();

  ProblemBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _message = _$v.message;
      _info = _$v.info?.toBuilder();
      _trace = _$v.trace;
      _state = _$v.state?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Problem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Problem;
  }

  @override
  void update(void Function(ProblemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Problem build() {
    _$Problem _$result;
    try {
      _$result = _$v ??
          new _$Problem._(
              type: type,
              message: message,
              info: info.build(),
              trace: trace,
              state: _state?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'info';
        info.build();

        _$failedField = 'state';
        _state?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Problem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
