import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/core/di/injection.dart';
import 'package:vd_login/common/auth/auth_cubit.dart';
import 'package:vd_login/core/router/router.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCubit = sl<AuthCubit>()..checkAuth();
    final router = AppRouter(authCubit).router;

    return BlocProvider.value(
      value: authCubit,
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}