import 'package:equatable/equatable.dart';
import 'package:dashboard/model/user_model.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;
  final List<UserModel> users;

  UserLoaded({required this.user, required this.users});

  @override
  List<Object> get props => [user, users];
}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object> get props => [message];
}

class UserCleared extends UserState {}
