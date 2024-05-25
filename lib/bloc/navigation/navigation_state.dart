import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationSuccess extends NavigationState {
  final int selectedIndex;

  const NavigationSuccess(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
