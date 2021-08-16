import 'package:http/http.dart' as http;

class GitHubClient extends http.BaseClient {
  final String _token;
  final http.Client _inner;

  GitHubClient(this._token, this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'token $_token';
    return _inner.send(request);
  }

  @override
  Future<http.Response> get(dynamic url, {Map<String, String> headers}) {
    headers ??= {};
    headers['Authorization'] = 'token $_token';
    return _inner.get(Uri.parse('$url'), headers: headers);
  }
}
