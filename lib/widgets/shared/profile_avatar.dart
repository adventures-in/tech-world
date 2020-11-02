import 'package:adventures_in_tech_world/actions/navigation/push_page.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/models/navigation/profile_page_data.dart';
import 'package:adventures_in_tech_world/utils/checked_circle_avatar.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String photoURL;
  const ProfileAvatar(
    this.photoURL, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        context.dispatch(PushPage(data: ProfilePageData()));
      },
      elevation: 0.0,
      fillColor: Colors.white,
      child: CircleAvatar(
        radius: 17,
        backgroundColor: Color(0xffFDCF09),
        child: CheckedCircleAvatar(radius: 15, url: photoURL),
      ),
      padding: EdgeInsets.all(5.0),
      shape: CircleBorder(),
    );
  }
}
