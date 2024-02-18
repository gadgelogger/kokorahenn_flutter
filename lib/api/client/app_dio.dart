// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';

class AppDio extends DioMixin {
  factory AppDio() {
    final instance = _instance;
    if (instance != null) {
      return instance;
    }
    final dio = AppDio._();
    final options = BaseOptions(
      baseUrl: 'https://webservice.recruit.co.jp/hotpepper/gourmet/v1',
      connectTimeout: const Duration(seconds: 15),
      headers: {
        'accept': '*/*',
        'Accept-Language': 'ja',
        'X-Api-Version': '2.0',
        'Content-Type': 'application/json',
      },
      contentType: 'application/json',
    );
    dio
      ..options = options
      ..httpClientAdapter = HttpClientAdapter();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          debugPrint('######## Request Log ########');
          debugPrint('--> ${options.method} ${options.path}');
          debugPrint('Full URL: ${options.uri}');
          debugPrint('Headers: ${options.headers}');
          debugPrint('Query Parameters: ${options.queryParameters}');
          debugPrint('Request Data: ${options.data}');
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          debugPrint('######## Response Log ########');
          debugPrint(
            '<-- ${response.statusCode} ${response.requestOptions.path}',
          );
          debugPrint('Headers: ${response.headers}');
          debugPrint('Response Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          debugPrint('######## Error Log ########');
          debugPrint('<-- Error --> ${e.message}');
          return handler.next(e);
        },
      ),
    );
    _instance = dio;
    return dio;
  }

  AppDio._();

  static AppDio? _instance;
}
