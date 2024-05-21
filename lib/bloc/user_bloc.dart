import 'package:bloc/bloc.dart';
import 'package:dashboard/model/user_model.dart';
import 'package:dashboard/provider/user_provider.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserProvider userProvider;
  List<UserModel> _accounts =
      []; // Tambahkan ini untuk menyimpan daftar pengguna

  UserBloc(this.userProvider) : super(UserInitial()) {
    on<FetchUser>(_onFetchUser);
    on<ClearUser>(_onClearUser);
    on<SwitchUser>(_onSwitchUser);
  }

  Future<void> _onFetchUser(FetchUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await userProvider.fetchUser();
      _accounts = users; // Simpan pengguna yang diambil ke _accounts
      emit(UserLoaded(user: users.first, users: users));
    } catch (e) {
      emit(UserError('Failed to load user data'));
    }
  }

  void _onClearUser(ClearUser event, Emitter<UserState> emit) {
    userProvider.clearUser();
    emit(UserCleared());
  }

  void _onSwitchUser(SwitchUser event, Emitter<UserState> emit) {
    userProvider.setUser(event.newUser); // Set user baru di UserProvider
    emit(UserLoaded(user: event.newUser, users: _accounts));
  }
}
