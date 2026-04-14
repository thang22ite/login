import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/core/di/injection.dart';
import 'package:vd_login/common/auth/auth_cubit.dart';
import 'package:vd_login/common/auth/auth_state.dart';
import 'package:vd_login/presentation/cubit/login/login_cubit.dart';
import 'package:vd_login/presentation/pages/home_page.dart';
import 'package:vd_login/presentation/pages/login_page.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context,state){
        if(state is AppInitialState){
          return Scaffold(body: Center(child: Text("Init...")));
        }

        if(state is AuthLoading){
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if(state is Authenticated){
          return HomePage();
        }

        if(state is UnAuthenticated){
          return BlocProvider(
            create: (_) => sl<LoginCubit>(),
            child: LoginPage(),
          );
        }

        if(state is AuthError){
          return Scaffold(body: Center(child: Text(state.message)));
        }

        return SizedBox();
      }
    );
  }

}