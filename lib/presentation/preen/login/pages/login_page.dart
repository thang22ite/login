import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/common/blocs/auth/auth_cubit.dart';
import 'package:vd_login/presentation/preen/login/bloc/login_cubit.dart';
import 'package:vd_login/presentation/preen/login/bloc/login_state.dart';
import 'package:vd_login/presentation/preen/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }

            if (state is LoginSuccess) {
              context.read<AuthCubit>().checkAuth();
            }
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}