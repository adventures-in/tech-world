import 'package:adventures_in_tech_world/actions/navigation/navigate_to_profile.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
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
        context.dispatch(NavigateToProfile());
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
