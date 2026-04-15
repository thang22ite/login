import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vd_login/domain/usecases/login_usecase.dart';
import 'package:vd_login/domain/usecases/save_token_usecase.dart';
import 'package:vd_login/presentation/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  final sl = GetIt.instance;


  LoginCubit() : super (LoginInitial());

  Future<void> login(String email, String password)async{
    emit(LoginLoading());
    try{
      final loginUsecase  = sl<LoginUsecase>();
      final saveTokenUsecase = sl<SaveTokenUsecase>();

      final user = await loginUsecase(email,password);
      await saveTokenUsecase(user.accessToken);
      emit(LoginSuccess());
    }catch (e) {
      emit(LoginError(e.toString()));
    }
  }

}