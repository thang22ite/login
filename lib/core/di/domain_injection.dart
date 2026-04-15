import 'package:get_it/get_it.dart';
import 'package:vd_login/domain/repository/auth_repository.dart';
import 'package:vd_login/domain/usecases/get_token_usecase.dart';
import 'package:vd_login/domain/usecases/login_usecase.dart';
import 'package:vd_login/domain/usecases/logout_usecase.dart';
import 'package:vd_login/domain/usecases/save_token_usecase.dart';

Future<void> initDomain(GetIt sl) async {
  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<GetTokenUsecase>(
    () => GetTokenUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<SaveTokenUsecase>(
    () => SaveTokenUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(sl<AuthRepository>()),
  );
}