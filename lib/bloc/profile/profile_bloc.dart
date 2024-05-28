import 'package:dashboard/bloc/profile/profile_event.dart';
import 'package:dashboard/bloc/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<FetchProfile>(_onFetchProfile);
    on<ChangeProfile>(_onChangeProfile);
  }

  Future<void> _onFetchProfile(
      FetchProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      var dio = Dio();
      final response = await dio
          .get('https://65379935bb226bb85dd37d8b.mockapi.io/diantar_aja');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data.isNotEmpty) {
          emit(state.copyWith(
            name: data[0]['name'],
            email: data[0]['email'],
            permissions: List<String>.from(data[0]['permissions']),
            accounts: data,
            isLoading: false,
          ));
        } else {
          emit(state.copyWith(isLoading: false, hasError: true));
        }
      } else {
        emit(state.copyWith(isLoading: false, hasError: true));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  void _onChangeProfile(ChangeProfile event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      name: event.name,
      email: event.email,
      permissions: event.permissions,
    ));
  }
}
