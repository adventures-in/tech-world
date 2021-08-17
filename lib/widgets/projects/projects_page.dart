import 'package:flutter/material.dart';
import 'package:redfire/extensions.dart';
import 'package:tech_world/actions/google/create_google_doc.dart';
import 'package:tech_world/main.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: MaterialButton(
        child: Text('Create a file in Drive'),
        onPressed: () =>
            context.dispatch<AppState>(CreateGoogleDoc(name: 'Test')),
      )),
    );
  }
}
