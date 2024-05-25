import 'package:bloc/bloc.dart';
import 'package:dashboard/helpers/page_routing/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigateToPageEvent>((event, emit) {
      Application.router.navigateTo(event.context, event.route,
          transition: TransitionType.fadeIn);
      emit(NavigationSuccess(event.index)); // Emit the index to update the UI
    });
  }
}
