import 'package:get_it/get_it.dart';
import 'package:vd_login/core/api/dio_client.dart';
import 'package:vd_login/core/storage/local_storage.dart';
import 'package:vd_login/data/datasource/auth_api.dart';
import 'package:vd_login/data/repository/auth_repository_impl.dart';
import 'package:vd_login/domain/repository/auth_repository.dart';
import 'package:vd_login/domain/usecases/login_usecase.dart';
import 'package:vd_login/presentation/cubit/auth/auth_cubit.dart';
import 'package:vd_login/presentation/cubit/login/login_cubit.dart';

final sl = GetIt.instance;
Future<void> init()async{
  sl.registerLazySingleton(() => DioClient().dio);//dio

  sl.registerLazySingleton(() => AuthApi(sl())); //api

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl())); //repo

  sl.registerLazySingleton(() => LoginUsecase(sl())); //usecase

  sl.registerLazySingleton(() => LocalStorage()); //storage

  sl.registerLazySingleton(() => AuthCubit(sl())); // authcubit

  sl.registerFactory(() => LoginCubit(sl(), sl())); //logincubit
}