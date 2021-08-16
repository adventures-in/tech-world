import 'package:adventures_in_tech_world/actions/google/create_google_doc.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: MaterialButton(
        child: Text('Create a file in Drive'),
        onPressed: () => context.dispatch(CreateGoogleDoc(name: 'Test')),
      )),
    );
  }
}
