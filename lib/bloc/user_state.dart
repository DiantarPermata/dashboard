import 'package:equatable/equatable.dart';
import 'package:dashboard/model/user_model.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUser extends UserEvent {}

class ClearUser extends UserEvent {}

class SwitchUser extends UserEvent {
  final UserModel newUser;

  SwitchUser(this.newUser);

  @override
  List<Object> get props => [newUser];
}
