import 'package:vd_login/domain/entities/auth_user.dart';
import 'package:vd_login/domain/repository/auth_repository.dart';
import 'package:vd_login/domain/usecases/login/login_params.dart';

class LoginUsecase {
  final AuthRepository repo;
  LoginUsecase(this.repo);

  Future<AuthUser> call(LoginParams params){
    return repo.login(params.email, params.password);
  }
}