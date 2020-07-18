import 'package:adventures_in_tech_world/widgets/profile/profile_page.dart';
import 'package:adventures_in_tech_world/widgets/projects/projects_page.dart';
import 'package:adventures_in_tech_world/widgets/topics/topics_page.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:flutter/material.dart';

part 'nav_selection.g.dart';

class NavSelection extends EnumClass {
  static Serializer<NavSelection> get serializer => _$navSelectionSerializer;
  static const NavSelection projects = _$projects;
  static const NavSelection topics = _$topics;
  static const NavSelection profile = _$profile;

  static const Map<NavSelection, int> _$indexMap = {
    projects: 0,
    topics: 1,
    profile: 2,
  };

  static const Map<NavSelection, Widget> _$widgetMap = {
    projects: ProjectsPage(),
    topics: TopicsPage(),
    profile: ProfilePage(),
  };

  const NavSelection._(String name) : super(name);

  int get index => _$indexMap[this];
  Widget get widget => _$widgetMap[this];
  static BuiltSet<NavSelection> get values => _$values;
  static NavSelection valueOf(String name) => _$valueOf(name);

  static NavSelection valueOfIndex(int index) {
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

  Object toJson() => serializers.serializeWith(NavSelection.serializer, this);
}
