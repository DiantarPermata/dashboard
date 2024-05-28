import 'package:dashboard/bloc/header_title/header_title_bloc.dart';
import 'package:dashboard/bloc/header_title/header_title_event.dart';
import 'package:dashboard/helpers/page_routing/application.dart';
import 'package:dashboard/helpers/page_routing/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigateToPageEvent>(_onNavigateToPage);
  }

  void _onNavigateToPage(
      NavigateToPageEvent event, Emitter<NavigationState> emit) {
    final titleMap = {
      Routes.dashboard: 'Dashboard',
      Routes.transaction: 'Transaction',
      Routes.task: 'Task',
      Routes.documents: 'Documents',
      Routes.store: 'Store',
      Routes.notification: 'Notification',
      Routes.profile: 'Profile',
      Routes.settings: 'Settings',
    };

    final String title = titleMap[event.route] ?? 'Dashboard';

    // Update title
    BlocProvider.of<HeaderTitleBloc>(event.context)
        .add(UpdateTitleEvent(title));

    Application.router.navigateTo(event.context, event.route,
        transition: TransitionType.fadeIn);
    emit(NavigationSuccess(event.index, title));
  }
}
