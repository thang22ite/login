import 'package:vd_login/domain/entities/auth_user.dart';
import 'package:vd_login/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repo;
  LoginUsecase(this.repo);

  Future<AuthUser> call(String email, String password){
    return repo.login(email, password);
  }
}