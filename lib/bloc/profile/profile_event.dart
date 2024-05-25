import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchProfile extends ProfileEvent {}

class ChangeProfile extends ProfileEvent {
  final String name;
  final String email;
  final List<String> permissions;

  const ChangeProfile(
      {required this.name, required this.email, required this.permissions});

  @override
  List<Object> get props => [name, email, permissions];
}
