import 'package:get_it/get_it.dart';
import 'package:vd_login/common/blocs/auth/auth_cubit.dart';
import 'package:vd_login/domain/usecases/get_token_usecase.dart';
import 'package:vd_login/domain/usecases/logout_usecase.dart';
import 'package:vd_login/domain/usecases/login_usecase.dart';
import 'package:vd_login/domain/usecases/save_token_usecase.dart';
import 'package:vd_login/presentation/cubit/login/login_cubit.dart';

Future<void> initPresentation(GetIt sl) async {
  /// AuthCubit (global)
  sl.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      sl<GetTokenUsecase>(),
      sl<LogoutUsecase>(),
    ),
  );

  /// LoginCubit (create mới mỗi lần)
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      sl<LoginUsecase>(),
      sl<SaveTokenUsecase>(),
    ),
  );
}