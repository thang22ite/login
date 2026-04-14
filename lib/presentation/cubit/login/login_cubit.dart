import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/domain/usecases/login_usecase.dart';
import 'package:vd_login/presentation/cubit/auth/auth_cubit.dart';
import 'package:vd_login/presentation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  final LoginUsecase loginUsecase;
  final AuthCubit authCubit;

  LoginCubit(this.loginUsecase, this.authCubit) : super (LoginState());

  Future<void> login(String email, String password)async{
    emit(state.copyWith(isLoading: true,error: null));
    try{
      final token = await loginUsecase(email,password);
      await authCubit.setAuthenticated(token);
      emit(state.copyWith(isLoading: false));
    }catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(), 
  ));
}
  }

}