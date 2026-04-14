import 'package:dio/dio.dart';

class AuthApi {
  final Dio dio;

  AuthApi(this.dio);

  Future<String> login(String email, String password) async {
    try {
      final res = await dio.post(
        '/auth/v1/token?grant_type=password',
        data: {
          'email': email,
          'password': password,
        },
      );

      return res.data['access_token'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['error_description'] ?? 'Login failed');
    }
  }
}