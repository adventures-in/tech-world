import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub GraphQL API Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'GitHub GraphQL API Client'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GithubLoginWidget(
      builder: (context, httpClient) {
        final link = HttpLink(
          'https://api.github.com/graphql',
          httpClient: httpClient,
        );
        return FutureBuilder<$ViewerDetail$viewer>(
          future: viewerDetail(link),
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Center(
                child: Text(
                  snapshot.hasData
                      ? 'Hello ${snapshot.data.login}!'
                      : 'Retrieving viewer login details...',
                ),
              ),
            );
          },
        );
      },
      githubClientId: 'githubClientId',
      githubClientSecret: 'githubClientSecret',
      githubScopes: ['githubScopes'],
    );
  }
}

Future<$ViewerDetail$viewer> viewerDetail(Link link) async {
  var result = await link.request(ViewerDetail((b) => b)).first;
  if (result.errors != null && result.errors.isNotEmpty) {
    throw QueryException(result.errors);
  }
  return $ViewerDetail(result.data).viewer;
}

class QueryException implements Exception {
  QueryException(this.errors);
  List<GraphQLError> errors;
  @override
  String toString() {
    return 'Query Exception: ${errors.map((err) => '$err').join(',')}';
  }
}
