import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vd_login/common/blocs/auth/auth_state.dart';
import 'package:vd_login/domain/usecases/get_token_usecase.dart';
import 'package:vd_login/domain/usecases/logout_usecase.dart';

class AuthCubit extends Cubit<AuthState>{
  final sl = GetIt.instance;

  AuthCubit() : super(AppInitialState());

  Future<void> checkAuth() async {
    emit(AuthLoading());

    try {
      final token = await sl<GetTokenUsecase>()();

      if (token != null) {
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated()); 
    }
  }

  Future<void> logout() async{
    await sl<LogoutUsecase>()();
    emit(UnAuthenticated());
  }
}