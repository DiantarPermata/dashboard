import 'package:dashboard/data%20copy/models/sample_model.dart';
import 'package:dashboard/helpers/network/api_helper.dart';
import 'package:dio/dio.dart';

class MsSampleService {
  final ApiHelper apiHelper;
  MsSampleService({required this.apiHelper});

  Future<MsSampleData> getAllSample() async {
    try {
      final result = await apiHelper.get(
        url: "https://https://binusmaya.binus.ac.id/sample",
      );
      return MsSampleData.fromJson(result);
    } on DioException {
      rethrow;
    }
  }
}
