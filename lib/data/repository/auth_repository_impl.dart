import 'package:vd_login/data/datasource/auth_api.dart';
import 'package:vd_login/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthApi api;

  AuthRepositoryImpl(this.api);

  @override
  Future<String> login(String email, String password) {
    return api.login(email, password);
  }

}