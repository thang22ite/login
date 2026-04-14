import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/core/storage/local_storage.dart';
import 'package:vd_login/common/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  final LocalStorage storage;

  AuthCubit(this.storage) : super(AppInitialState());

  Future<void> checkAuth() async {
    emit(AuthLoading());

    try {
      final token = await storage.getToken();

      if (token != null) {
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated()); // ⭐ QUAN TRỌNG
    }
  }

  Future<void> setAuthenticated(String token)async{
    try {
      await storage.saveToken(token);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async{
    await storage.clearToken();
    emit(UnAuthenticated());
  }
}