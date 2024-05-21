class UserModel {
  final String name;
  final String email;
  final List<String> permissions;

  UserModel(
      {required this.name, required this.email, required this.permissions});

  factory UserModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return UserModel(
        name: json['name'],
        email: json['email'],
        permissions: List<String>.from(json['permissions']),
      );
    } else if (json is List) {
      final userJson = json.first;
      return UserModel(
        name: userJson['name'],
        email: userJson['email'],
        permissions: List<String>.from(userJson['permissions']),
      );
    }
    throw Exception('Invalid JSON format');
  }
}
