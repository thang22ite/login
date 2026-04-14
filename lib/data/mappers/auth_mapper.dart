import 'package:vd_login/data/models/auth_user_model.dart';
import 'package:vd_login/domain/entities/auth_user.dart';

class AuthMapper {
  static AuthUser toEntity(AuthUserModel model) {
    return AuthUser(
      accessToken: model.accessToken,
    );
  }

  static AuthUserModel toModel(AuthUser entity) {
    return AuthUserModel(
      accessToken: entity.accessToken,
    );
  }
}