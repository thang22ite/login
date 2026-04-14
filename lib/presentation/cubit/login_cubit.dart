import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/domain/usecases/login_usecase.dart';
import 'package:vd_login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  final LoginUsecase loginUsecase;

  LoginCubit(this.loginUsecase) : super (LoginState());
  Future<void> login(String email, String password)async{
    emit(state.copyWith(isLoading: true,error: null));
    try{
      final token = await loginUsecase(email,password);
      emit(state.copyWith(isLoading: false,token: token));
    }catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(), 
  ));
}
  }

}