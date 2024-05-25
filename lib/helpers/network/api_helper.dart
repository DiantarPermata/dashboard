import 'package:dio/dio.dart';

abstract class ApiHelper {
  Future<List<dynamic>> get({
    required String url,
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<List<dynamic>> post({
    required String url,
    required dynamic body,
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<List<dynamic>> patch({
    required String url,
    required dynamic body,
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<List<dynamic>> downloadUri({
    required String url,
    required dynamic body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> getImage({
    required String url,
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });
}
