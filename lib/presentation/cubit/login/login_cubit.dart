import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/core/di/injection.dart';
import 'package:vd_login/domain/usecases/login_usecase.dart';
import 'package:vd_login/domain/usecases/save_token_usecase.dart';
import 'package:vd_login/presentation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{

  LoginCubit() : super (LoginInitial());

  Future<void> login(String email, String password)async{
    emit(LoginLoading());
    try{
      final loginUsecase  = await sl<LoginUsecase>()(email, password);
      await sl<SaveTokenUsecase>()(loginUsecase.accessToken);
      emit(LoginSuccess());
    }catch (e) {
      emit(LoginError(e.toString()));
    }
  }

}