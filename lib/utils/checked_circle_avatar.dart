import 'dart:async';

import 'package:flutter/material.dart';

/// A widget that precaches the NetworkImage part of a CircleAvatar, checks for
/// any errors and if found, returns a widget that indicates something went
/// wrong.
class CheckedCircleAvatar extends StatelessWidget {
  final String _url;
  final double _radius;
  CheckedCircleAvatar({@required String url, @required double radius})
      : _url = url,
        _radius = radius;
  Future<bool> cacheImage(String url, BuildContext context) async {
    var hasNoError = true;
    var output = Completer<bool>();
    await precacheImage(
      NetworkImage(_url),
      context,
      onError: (e, stackTrace) => hasNoError = false,
    );
    output.complete(hasNoError);
    return output.future;
  }

  @override
  Widget build(context) {
    return FutureBuilder(
      future: cacheImage(_url, context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.hasError) {
          return Container(
            height: 80.0,
            decoration: BoxDecoration(color: Colors.grey),
            child: Center(
              child: Text(
                'Error',
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: BoxDecoration(color: Colors.grey),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data == false) {
          return Container(
            height: 80.0,
            decoration: BoxDecoration(color: Colors.grey),
            child: Center(
              child: Text(
                'Error',
                style: TextStyle(fontSize: 10.0),
              ),
            ),
          );
        }
        return CircleAvatar(
            radius: _radius, backgroundImage: Image.network(_url).image);
      },
    );
  }
}
