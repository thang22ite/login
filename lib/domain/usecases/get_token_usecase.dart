import 'package:vd_login/domain/repository/auth_repository.dart';

class GetTokenUsecase {
  final AuthRepository repo;

  GetTokenUsecase(this.repo);

  Future<String?> call() {
    return repo.getToken();
  }
}