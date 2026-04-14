import 'package:vd_login/data/datasource/auth_api.dart';
import 'package:vd_login/data/mappers/auth_mapper.dart';
import 'package:vd_login/domain/entities/auth_user.dart';
import 'package:vd_login/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi api;

  AuthRepositoryImpl(this.api);

  @override
  Future<AuthUser> login(String email, String password) async {
    final model = await api.login(email, password);
    return AuthMapper.toEntity(model);
  }
}