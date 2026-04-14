import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/common/blocs/auth/auth_cubit.dart';
import 'package:vd_login/domain/usecases/login_usecase.dart';
import 'package:vd_login/presentation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  final LoginUsecase loginUsecase;
  final AuthCubit authCubit;

  LoginCubit(this.loginUsecase, this.authCubit) : super (LoginInitial());

  Future<void> login(String email, String password)async{
    emit(LoginLoading());
    try{
      final token = await loginUsecase(email,password);
      emit(LoginSuccess(token.accessToken));
      await authCubit.setAuthenticated(token.accessToken);
    }catch (e) {
      emit(LoginError(e.toString()));
    }
  }

}