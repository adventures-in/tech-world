import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page.dart';
import 'package:adventures_in_tech_world/widgets/projects/projects_page.dart';
import 'package:adventures_in_tech_world/widgets/topics/topics_page.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/widgets.dart';

part 'nav_bar_selection.g.dart';

class NavBarSelection extends EnumClass {
  static Serializer<NavBarSelection> get serializer =>
      _$navBarSelectionSerializer;
  static const NavBarSelection projects = _$projects;
  static const NavBarSelection topics = _$topics;
  static const NavBarSelection profile = _$profile;

  static const Map<NavBarSelection, int> _$indexMap = {
    projects: 0,
    topics: 1,
    profile: 2,
  };

  static const Map<NavBarSelection, Widget> _$widgetMap = {
    projects: ProjectsPage(),
    topics: TopicsPage(),
    profile: ProfilePage(),
  };

  const NavBarSelection._(String name) : super(name);

  int get index => _$indexMap[this];
  Widget get widget => _$widgetMap[this];
  static BuiltSet<NavBarSelection> get values => _$values;
  static NavBarSelection valueOf(String name) => _$valueOf(name);
  static NavBarSelection valueOfIndex(int index) {
    switch (index) {
      case 0:
        return _$projects;
      case 1:
        return _$topics;
      case 2:
        return _$profile;
      default:
        throw ArgumentError(index);
    }
  }

  Object toJson() =>
      serializers.serializeWith(NavBarSelection.serializer, this);
}
