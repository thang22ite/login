import 'package:vd_login/domain/repository/auth_repository.dart';

class SaveTokenUsecase {
  final AuthRepository repo;

  SaveTokenUsecase(this.repo);

  Future<void> call(String token) {
    return repo.saveToken(token);
  }
}