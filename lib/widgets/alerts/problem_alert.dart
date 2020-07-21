import 'package:adventures_in_tech_world/models/problems/problem.dart';
import 'package:flutter/material.dart';

class ProblemAlert extends StatelessWidget {
  final Problem problem;

  ProblemAlert({this.problem});

  @override
  Widget build(BuildContext context) {
    print('traceString: ${problem.traceString}');
    return AlertDialog(
      title: Text('Dammit!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Looks like there was A problem.'),
            SizedBox(height: 20),
            ListView.builder(
                itemCount: problem.info.keys.length,
                itemBuilder: (context, index) {
                  final key = problem.info.keys.elementAt(index);
                  final value = problem.info[key];
                  return Text('$key: $value');
                }),
            Text('error: ${problem.errorString}'),
            SizedBox(height: 20),
            Text(problem.traceString),
            // RichText(
            //   text: TextSpan(
            //     text: problem.traceString,
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
            //   ),
            // )
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
