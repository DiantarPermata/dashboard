import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToPageEvent extends NavigationEvent {
  final BuildContext context;
  final String route;
  final int index;

  const NavigateToPageEvent(this.context, this.route, this.index);

  @override
  List<Object> get props => [context, route, index];
}
