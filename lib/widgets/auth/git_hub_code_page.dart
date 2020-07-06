import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GitHubCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, String>(
        distinct: true,
        converter: (store) => store.state.authToken,
        builder: (context, token) => Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Got your token!'),
              SizedBox(height: 15),
              Text(token ?? '...')
            ],
          ),
        ),
      );
}
