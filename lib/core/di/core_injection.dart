import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vd_login/core/api/dio_client.dart';
import 'package:vd_login/core/storage/local_storage.dart';

Future<void> initCore(GetIt sl) async {
  /// DioClient
  sl.registerLazySingleton<DioClient>(() => DioClient());

  /// Dio
  sl.registerLazySingleton<Dio>(
    () => sl<DioClient>().dio,
  );

  /// LocalStorage
  sl.registerLazySingleton<LocalStorage>(
    () => LocalStorage(),
  );
}