import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dashboard/model/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<List<UserModel>> fetchUser() async {
    final url = 'https://65379935bb226bb85dd37d8b.mockapi.io/diantar_aja';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is List) {
          return jsonData.map((json) => UserModel.fromJson(json)).toList();
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load accounts');
      }
    } catch (e) {
      print('Error fetching accounts: $e');
      throw e;
    }
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  void setUser(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }
}
