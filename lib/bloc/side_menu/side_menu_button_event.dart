import 'package:equatable/equatable.dart';

abstract class SideMenuEvent extends Equatable {
  const SideMenuEvent();

  @override
  List<Object> get props => [];
}

class ToggleSideMenuEvent extends SideMenuEvent {}
