import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluro/fluro.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';
import 'package:dashboard/bloc/profile/profile_bloc.dart';
import 'package:dashboard/bloc/profile/profile_state.dart';
import 'package:dashboard/helpers/page_routing/routes.dart';
import 'package:dashboard/helpers/page_routing/application.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigateToPageEvent>(_onNavigateToPage);
  }

  void _onNavigateToPage(
      NavigateToPageEvent event, Emitter<NavigationState> emit) {
    final profileBloc = BlocProvider.of<ProfileBloc>(event.context);
    final ProfileState profileState = profileBloc.state;
    final List<String> permissions = profileState.permissions;

    final routePermissionsMap = {
      Routes.dashboard: 'dashboard',
      Routes.transaction: 'transaction',
      Routes.task: 'task',
      Routes.documents: 'documents',
      Routes.store: 'store',
      Routes.notification: 'notification',
      Routes.profile: 'profile',
      Routes.settings: 'settings',
    };

    final String? requiredPermission = routePermissionsMap[event.route];

    if (requiredPermission != null &&
        permissions.contains(requiredPermission)) {
      Application.router.navigateTo(event.context, event.route,
          transition: TransitionType.fadeIn);
      emit(NavigationSuccess(event.index));
    } else {
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          content: Text('Anda tidak memiliki akses untuk ke page ini'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
