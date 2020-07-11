import 'package:dio/dio.dart';

class GitHubService {
  final Dio _dio;
  String _token;

  set token(String token) {
    _token = token;

    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
        // Do something before request is sent
        options.baseUrl = 'https://api.github.com/';
        options.headers['Authorization'] = 'token $_token';
        return options; //continue
      }, onResponse: (Response response) async {
        // Do something with response data
        return response; // continue
      }, onError: (DioError e) async {
        // Do something with response error
        return e; //continue
      }),
    );
  }

  GitHubService(this._dio);

  // "Authorization: token TOKEN" https://api.github.com/user/issues

  Future<String> test() async {
    final result = await _dio.get<String>('user/issues');
    print(result);
    return result.data;
  }
}
