import 'package:flutter/material.dart';

/// This widget just displays the available info if there is an error during
/// intialization.
///
/// It's not particularly pretty but it shouldn't ever be seen and if it is,
/// we just need to view the available info.
class InitializingErrorPage extends StatelessWidget {
  final dynamic _error;
  final StackTrace _trace;
  const InitializingErrorPage({
    @required dynamic error,
    @required StackTrace trace,
    Key key,
  })  : _error = error,
        _trace = trace,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            SizedBox(height: 50),
            Text('Looks like there was a problem.',
                textDirection: TextDirection.ltr),
            SizedBox(height: 20),
            Text(_error.toString(), textDirection: TextDirection.ltr),
            SizedBox(height: 50),
            Text(_trace.toString(), textDirection: TextDirection.ltr),
          ],
        ),
      ),
    );
  }
}
