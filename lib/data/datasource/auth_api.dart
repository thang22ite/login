import 'package:dio/dio.dart';
import 'package:vd_login/data/models/auth_user_model.dart';

class AuthApi {
  final Dio dio;

  AuthApi(this.dio);

  Future<AuthUserModel> login(String email, String password) async {
    try {
      final res = await dio.post(
        '/auth/v1/token?grant_type=password',
        data: {
          'email': email,
          'password': password,
        },
      );

      return AuthUserModel.fromJson(res.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['error_description'] ?? 'Login failed');
    }
  }
}