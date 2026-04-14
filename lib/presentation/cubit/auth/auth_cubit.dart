import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/core/storage/local_storage.dart';
import 'package:vd_login/presentation/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  final LocalStorage storage;

  AuthCubit(this.storage) : super(AppInitialState());

  Future<void> checkAuth()async{
    emit(AuthLoading());
    final token = await storage.getToken();

    if(token != null){
      emit(Authenticated());
    }else{
      emit(UnAuthenticated());
    }
  }

  Future<void> setAuthenticated(String token)async{
    await storage.saveToken(token);
    emit(Authenticated());
  }

  Future<void> logout() async{
    await storage.clearToken();
    emit(UnAuthenticated());
  }
}