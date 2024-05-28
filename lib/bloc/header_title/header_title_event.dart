import 'package:equatable/equatable.dart';

abstract class HeaderTitleEvent extends Equatable {
  const HeaderTitleEvent();

  @override
  List<Object> get props => [];
}

class UpdateTitleEvent extends HeaderTitleEvent {
  final String title;

  const UpdateTitleEvent(this.title);

  @override
  List<Object> get props => [title];
}
