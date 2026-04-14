import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/core/di/injection.dart';
import 'package:vd_login/presentation/cubit/login_cubit.dart';
import 'package:vd_login/presentation/pages/login_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => sl<LoginCubit>() ,
        child: LoginPage(),
      ),
    );
  }

}