import 'package:dashboard/helpers/network/api_helper.dart';
import 'package:dio/dio.dart';

class ApiHelperImpl extends ApiHelper {
  final Dio dio;
  ApiHelperImpl({
    required this.dio,
  }) {
    initDio();
  }

  Dio initDio() {
    return dio;
  }

  @override
  Future<List<dynamic>> get({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.get(
        url,
        options: options,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      // If Token Expired
      Response response;
      if (e.response!.statusCode == 403) {
        response = await dio.get(
          url,
          options: options,
          queryParameters: queryParameters,
        );
        return response.data;
      }

      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<dynamic>> post(
      {required String url,
      required dynamic body,
      Options? options,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await dio.post(
        url,
        options: options,
        data: body,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      // If Token Expired
      Response response;
      if (e.response!.statusCode == 403) {
        response = await dio.post(
          url,
          options: options,
          data: body,
          queryParameters: queryParameters,
        );
        return response.data;
      }

      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<dynamic>> patch(
      {required String url,
      required body,
      Options? options,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    try {
      // Hit the request URL
      Response response = await dio.patch(
        url,
        data: body,
        options: options,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      // If Token Expired
      Response response;
      if (e.response!.statusCode == 403) {
        response = await dio.patch(
          url,
          options: options,
          data: body,
          queryParameters: queryParameters,
        );
        return response.data;
      }

      rethrow;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<dynamic>> downloadUri(
      {required String url,
      required body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await dio.downloadUri(Uri.parse(url), body);
      return response.data;
    } on DioException {
      List<dynamic> error = [''];
      return error;
    }
  }

  @override
  Future<Response> getImage(
      {required String url,
      Options? options,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await dio.get(url, options: options);
      return response;
    } on DioException catch (e) {
      Response error = e.error as Response;
      return error;
    }
  }
}
