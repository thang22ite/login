import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/common/blocs/auth/auth_state.dart';
import 'package:vd_login/domain/usecases/get_token_usecase.dart';
import 'package:vd_login/domain/usecases/logout_usecase.dart';


class AuthCubit extends Cubit<AuthState>{
  final GetTokenUsecase getToken;
  final LogoutUsecase logoutUsecase;


  AuthCubit(this.getToken, this.logoutUsecase) : super(AppInitialState());

  Future<void> checkAuth() async {
    emit(AuthLoading());

    try {
      final token = await getToken();

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
    await logoutUsecase();
    emit(UnAuthenticated());
  }
}