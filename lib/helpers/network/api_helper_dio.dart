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
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request [${options.method}] ${options.path}');
          print('Request data: ${options.data}');
          return handler.next(options); // Lanjutkan
        },
        onResponse: (response, handler) {
          print('Response [${response.statusCode}] ${response.requestOptions.path}');
          print('Response data: ${response.data}');
          return handler.next(response); // Lanjutkan
        },
        onError: (DioError error, handler) {
          print('Error: ${error.message}');
          if (error.response != null) {
            print('Error data: ${error.response?.data}');
            print('Error status code: ${error.response?.statusCode}');
          }
          return handler.next(error); // Lanjutkan
        },
      ),
    );
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
      if (e.response?.statusCode == 403) {
        Response response = await dio.get(
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
  Future<List<dynamic>> post({
    required String url,
    required dynamic body,
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.post(
        url,
        options: options,
        data: body,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        Response response = await dio.post(
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
  Future<List<dynamic>> patch({
    required String url,
    required dynamic body,
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.patch(
        url,
        data: body,
        options: options,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        Response response = await dio.patch(
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
  Future<List<dynamic>> downloadUri({
    required String url,
    required dynamic body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await dio.downloadUri(Uri.parse(url), body);
      return response.data;
    } on DioException {
      List<dynamic> error = [''];
      return error;
    }
  }

  @override
  Future<Response> getImage({
    required String url,
    Options? options,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await dio.get(url, options: options);
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
