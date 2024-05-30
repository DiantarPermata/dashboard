class ProfileModel {
  final String name;
  final String email;
  final List<String> permissions;

  ProfileModel({
    required this.name,
    required this.email,
    required this.permissions,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      permissions: List<String>.from(json['permissions']),
    );
  }
}
