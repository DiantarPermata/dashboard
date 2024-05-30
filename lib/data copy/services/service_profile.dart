import 'package:dashboard/data%20copy/models/profile_model.dart';
import 'package:dashboard/helpers/network/api_helper.dart';
import 'package:dio/dio.dart';

class ServiceProfile {
  final ApiHelper apiHelper;
  ServiceProfile({required this.apiHelper});

  Future<List<ProfileModel>> getAllProfiles() async {
    try {
      final result = await apiHelper.get(
        url: "https://65379935bb226bb85dd37d8b.mockapi.io/diantar_aja",
      );
      return result.map<ProfileModel>((json) => ProfileModel.fromJson(json)).toList();
    } on DioException {
      rethrow;
    }
  }
}
