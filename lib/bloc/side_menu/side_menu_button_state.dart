import 'package:equatable/equatable.dart';

abstract class SideMenuState extends Equatable {
  const SideMenuState();

  @override
  List<Object> get props => [];
}

class SideMenuClosed extends SideMenuState {}

class SideMenuOpened extends SideMenuState {}
