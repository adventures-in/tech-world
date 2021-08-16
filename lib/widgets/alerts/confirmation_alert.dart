import 'package:flutter/material.dart';

class ConfirmationAlert extends StatelessWidget {
  final String _question;

  ConfirmationAlert({String question}) : _question = question;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Just checking!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(_question),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop<bool>(true);
          },
        ),
        TextButton(
          child: Text('No'),
          onPressed: () {
            Navigator.of(context).pop<bool>(false);
          },
        ),
      ],
    );
  }
}
