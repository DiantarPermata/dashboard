import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationSuccess extends NavigationState {
  final int selectedIndex;
  final String title;

  const NavigationSuccess(this.selectedIndex, this.title);

  @override
  List<Object> get props => [selectedIndex, title];
}
