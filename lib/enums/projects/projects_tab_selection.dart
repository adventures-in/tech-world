import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'projects_tab_selection.g.dart';

class ProjectsTabSelection extends EnumClass {
  static Serializer<ProjectsTabSelection> get serializer =>
      _$projectsTabSelectionSerializer;
  static const ProjectsTabSelection repos = _$repos;
  static const ProjectsTabSelection issues = _$issues;
  static const ProjectsTabSelection pull_requests = _$pull_requests;
  static const Map<ProjectsTabSelection, int> _$indexMap = {
    repos: 0,
    issues: 1,
    pull_requests: 2,
  };

  const ProjectsTabSelection._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<ProjectsTabSelection> get values => _$values;
  static ProjectsTabSelection valueOf(String name) => _$valueOf(name);

  Object toJson() =>
      serializers.serializeWith(ProjectsTabSelection.serializer, this);
}
