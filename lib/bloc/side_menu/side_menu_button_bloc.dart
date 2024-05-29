import 'package:bloc/bloc.dart';
import 'package:dashboard/bloc/side_menu/side_menu_button_event.dart';
import 'package:dashboard/bloc/side_menu/side_menu_button_state.dart';

class SideMenuBloc extends Bloc<SideMenuEvent, SideMenuState> {
  SideMenuBloc() : super(SideMenuClosed()) {
    on<ToggleSideMenuEvent>((event, emit) {
      if (state is SideMenuClosed) {
        emit(SideMenuOpened());
      } else {
        emit(SideMenuClosed());
      }
    });
  }
}
