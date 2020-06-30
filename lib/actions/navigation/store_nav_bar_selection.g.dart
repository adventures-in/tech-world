// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_nav_bar_selection;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreNavBarSelection> _$storeNavBarSelectionSerializer =
    new _$StoreNavBarSelectionSerializer();

class _$StoreNavBarSelectionSerializer
    implements StructuredSerializer<StoreNavBarSelection> {
  @override
  final Iterable<Type> types = const [
    StoreNavBarSelection,
    _$StoreNavBarSelection
  ];
  @override
  final String wireName = 'StoreNavBarSelection';

  @override
  Iterable<Object> serialize(
      Serializers serializers, StoreNavBarSelection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'selection',
      serializers.serialize(object.selection,
          specifiedType: const FullType(NavBarSelection)),
    ];

    return result;
  }

  @override
  StoreNavBarSelection deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreNavBarSelectionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'selection':
          result.selection = serializers.deserialize(value,
                  specifiedType: const FullType(NavBarSelection))
              as NavBarSelection;
          break;
      }
    }

    return result.build();
  }
}

class _$StoreNavBarSelection extends StoreNavBarSelection {
  @override
  final NavBarSelection selection;

  factory _$StoreNavBarSelection(
          [void Function(StoreNavBarSelectionBuilder) updates]) =>
      (new StoreNavBarSelectionBuilder()..update(updates)).build();

  _$StoreNavBarSelection._({this.selection}) : super._() {
    if (selection == null) {
      throw new BuiltValueNullFieldError('StoreNavBarSelection', 'selection');
    }
  }

  @override
  StoreNavBarSelection rebuild(
          void Function(StoreNavBarSelectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreNavBarSelectionBuilder toBuilder() =>
      new StoreNavBarSelectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreNavBarSelection && selection == other.selection;
  }

  @override
  int get hashCode {
    return $jf($jc(0, selection.hashCode));
  }
}

class StoreNavBarSelectionBuilder
    implements Builder<StoreNavBarSelection, StoreNavBarSelectionBuilder> {
  _$StoreNavBarSelection _$v;

  NavBarSelection _selection;
  NavBarSelection get selection => _$this._selection;
  set selection(NavBarSelection selection) => _$this._selection = selection;

  StoreNavBarSelectionBuilder();

  StoreNavBarSelectionBuilder get _$this {
    if (_$v != null) {
      _selection = _$v.selection;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreNavBarSelection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StoreNavBarSelection;
  }

  @override
  void update(void Function(StoreNavBarSelectionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreNavBarSelection build() {
    final _$result = _$v ?? new _$StoreNavBarSelection._(selection: selection);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
