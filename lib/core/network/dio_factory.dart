import 'dart:io';

import 'package:dio/dio.dart';

Dio apiDioFactory() {
  final dio = Dio();
  dio.interceptors.add(AuthInterceptors());
  dio.options.baseUrl = 'https://api.github.com';

  final headers = dio.options.headers;
  headers[HttpHeaders.acceptHeader] = "application/vnd.github+json";
  headers[HttpHeaders.contentTypeHeader] = "application/json";
  headers['X-GitHub-Api-Version'] = "2022-11-28";

  return dio;
}

class AuthInterceptors extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token = '';
    options.headers
        .putIfAbsent(HttpHeaders.authorizationHeader, () => "Bearer $token");
    return super.onRequest(options, handler);
  }
}
