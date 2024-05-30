import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final String name;
  final String email;
  final List<String> permissions;
  final List<dynamic> accounts;
  final bool isLoading;
  final bool hasError;

  ProfileState({
    this.name = '',
    this.email = '',
    this.permissions = const [],
    this.accounts = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    List<String>? permissions,
    List<dynamic>? accounts,
    bool? isLoading,
    bool? hasError,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      permissions: permissions ?? this.permissions,
      accounts: accounts ?? this.accounts,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object> get props =>
      [name, email, permissions, accounts, isLoading, hasError];
}
