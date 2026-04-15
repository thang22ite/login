import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/core/di/injection.dart';
import 'package:vd_login/domain/usecases/login/login_params.dart';
import 'package:vd_login/domain/usecases/login/login_usecase.dart';
import 'package:vd_login/domain/usecases/save_token_usecase.dart';
import 'package:vd_login/presentation/preen/login/bloc/login_state.dart';

class LoginCubit extends Cubit<LoginState>{

  LoginCubit() : super (LoginInitial());

  Future<void> login(LoginParams params)async{
    emit(LoginLoading());
    try{
      final loginUsecase  = await sl<LoginUsecase>()(params);
      await sl<SaveTokenUsecase>()(loginUsecase.accessToken);
      emit(LoginSuccess());
    }catch (e) {
      emit(LoginError(e.toString()));
    }
  }

}