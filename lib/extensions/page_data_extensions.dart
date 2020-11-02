import 'package:adventures_in_tech_world/models/navigation/initial_page_data.dart';
import 'package:adventures_in_tech_world/models/navigation/page_data.dart';
import 'package:adventures_in_tech_world/models/navigation/profile_page_data.dart';
import 'package:adventures_in_tech_world/widgets/app/initial_page.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

/// We are using extensions in order to keep models as PODOs and avoid other
/// dependencies in the app state.
///
/// The challenge of trying to do polymorphism with extension methods, which is
/// already weird with built_value was getting quite difficult, so we have
/// gone with a big map for now and may come back to optimize in future.
extension NavigatorEntriesExt on BuiltList<PageData> {
  static final Map<PageData, MaterialPage> _pagesMap = {
    InitialPageData(): MaterialPage<InitialPage>(
        key: ValueKey(InitialPage), child: InitialPage()),
    ProfilePageData(): MaterialPage<ProfilePage>(
        key: ValueKey(ProfilePage), child: ProfilePage()),
  };

  List<MaterialPage> toPages() =>
      map<MaterialPage>((entry) => _pagesMap[entry]).toList();
}
