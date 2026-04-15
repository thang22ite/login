import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vd_login/domain/usecases/login/login_params.dart';
import 'package:vd_login/presentation/preen/login/bloc/login_cubit.dart';
import 'package:vd_login/presentation/preen/login/bloc/login_state.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CircularProgressIndicator();
        }

        return ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.saveAndValidate()) {
              final data = formKey.currentState!.value;

              context.read<LoginCubit>().login(
                    LoginParams(
                      email: data['email'],
                      password: data['password'],
                    ),
                  );
            }
          },
          child: const Text("Login"),
        );
      },
    );
  }
}