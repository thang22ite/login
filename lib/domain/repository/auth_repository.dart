import 'package:vd_login/domain/entities/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser> login(String email, String password);
}