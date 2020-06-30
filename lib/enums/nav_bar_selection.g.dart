// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_bar_selection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NavBarSelection _$projects = const NavBarSelection._('projects');
const NavBarSelection _$topics = const NavBarSelection._('topics');
const NavBarSelection _$profile = const NavBarSelection._('profile');

NavBarSelection _$valueOf(String name) {
  switch (name) {
    case 'projects':
      return _$projects;
    case 'topics':
      return _$topics;
    case 'profile':
      return _$profile;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<NavBarSelection> _$values =
    new BuiltSet<NavBarSelection>(const <NavBarSelection>[
  _$projects,
  _$topics,
  _$profile,
]);

Serializer<NavBarSelection> _$navBarSelectionSerializer =
    new _$NavBarSelectionSerializer();

class _$NavBarSelectionSerializer
    implements PrimitiveSerializer<NavBarSelection> {
  @override
  final Iterable<Type> types = const <Type>[NavBarSelection];
  @override
  final String wireName = 'NavBarSelection';

  @override
  Object serialize(Serializers serializers, NavBarSelection object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NavBarSelection deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NavBarSelection.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
