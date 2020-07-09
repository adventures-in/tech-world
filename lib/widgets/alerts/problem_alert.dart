import 'package:adventures_in_tech_world/models/problems/problem.dart';
import 'package:flutter/material.dart';

class ProblemAlert extends StatelessWidget {
  final Problem problem;

  ProblemAlert({this.problem});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Dammit!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Looks like there was a problem.'),
            SizedBox(height: 20),
            Text(problem.errorString),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: problem.traceString,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop<Problem>(problem);
          },
        ),
      ],
    );
  }
}
