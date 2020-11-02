import 'package:flutter/material.dart';

/// This widget is just a CircularProgressIndicator and some text, in a
/// Material widget so it looks nice, as it is used outside of the MaterialApp.
///
/// It's a separate widget as the existing ProgressIndicator widget doesn't
/// need to have it's contents in a Material widget.
class InitializingIndicator extends StatelessWidget {
  final bool firebaseDone;
  final bool reduxDone;
  const InitializingIndicator({
    @required this.firebaseDone,
    @required this.reduxDone,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var message = '';
    if (!firebaseDone) {
      message = 'Firing up the machine...';
    } else if (!reduxDone) {
      message = 'Plumbing the streams...';
    }
    return Material(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 30),
            Text(message, textDirection: TextDirection.ltr)
          ]),
    );
  }
}
