import 'package:flutter_bloc/flutter_bloc.dart';
import 'header_title_event.dart';
import 'header_title_state.dart';

class HeaderTitleBloc extends Bloc<HeaderTitleEvent, HeaderTitleState> {
  HeaderTitleBloc() : super(HeaderTitleInitial()) {
    on<UpdateTitleEvent>(_onUpdateTitle);
  }

  void _onUpdateTitle(UpdateTitleEvent event, Emitter<HeaderTitleState> emit) {
    emit(HeaderTitleUpdated(event.title));
  }
}
