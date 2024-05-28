import 'package:equatable/equatable.dart';

abstract class HeaderTitleState extends Equatable {
  const HeaderTitleState();

  @override
  List<Object> get props => [];
}

class HeaderTitleInitial extends HeaderTitleState {}

class HeaderTitleUpdated extends HeaderTitleState {
  final String title;

  const HeaderTitleUpdated(this.title);

  @override
  List<Object> get props => [title];
}
