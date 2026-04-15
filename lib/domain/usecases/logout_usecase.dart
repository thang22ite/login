import 'package:vd_login/domain/repository/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository repo;

  LogoutUsecase(this.repo);

  Future<void> call() {
    return repo.logout();
  }
}