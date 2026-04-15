import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'login_button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: _formKey,
          child: const Column(
            children: [
              EmailField(),
              SizedBox(height: 16),
              PasswordField(),
            ],
          ),
        ),
        const SizedBox(height: 20),
        LoginButton(formKey: _formKey),
      ],
    );
  }
}