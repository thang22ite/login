import 'package:get_it/get_it.dart';
import 'package:vd_login/core/storage/local_storage.dart';
import 'package:vd_login/data/datasource/auth_api.dart';
import 'package:vd_login/data/repository/auth_repository_impl.dart';
import 'package:vd_login/domain/repository/auth_repository.dart';

Future<void> initData(GetIt sl) async {
  /// API
  sl.registerLazySingleton<AuthApi>(
    () => AuthApi(sl()),
  );

  /// Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl<AuthApi>(),
      sl<LocalStorage>(),
    ),
  );
}