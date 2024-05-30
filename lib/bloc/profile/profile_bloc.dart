import 'package:bloc/bloc.dart';
import 'package:dashboard/bloc/profile/profile_event.dart';
import 'package:dashboard/bloc/profile/profile_state.dart';
import 'package:dashboard/data%20copy/services/service_profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ServiceProfile serviceProfile;

  ProfileBloc({required this.serviceProfile}) : super(ProfileState()) {
    on<FetchProfile>(_onFetchProfile);
    on<ChangeProfile>(_onChangeProfile);
  }

  Future<void> _onFetchProfile(
      FetchProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final data = await serviceProfile.getAllProfiles();
      if (data.isNotEmpty) {
        emit(state.copyWith(
          name: data[0].name,
          email: data[0].email,
          permissions: data[0].permissions,
          accounts: data,
          isLoading: false,
        ));
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
