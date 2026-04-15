import 'package:vd_login/domain/entities/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser> login(String email, String password);
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> logout();

}