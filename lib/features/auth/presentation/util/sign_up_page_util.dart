import 'package:flutter/material.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

final class SignInPageUtil {
  void submitCredentials({
    required GlobalKey<FormState> formKey,
    required SignUpBloc bloc,
    required TextEditingController firstName,
    required TextEditingController lastName,
    required TextEditingController email,
    required TextEditingController passWord,
    required TextEditingController confirmPassword,
  }) {
    firstName.text.trim();
    lastName.text.trim();
    email.text.trim();
    passWord.text.trim();
    confirmPassword.text.trim();
    if (formKey.currentState!.validate()) {
      bloc.add(
        CreateUserEvent(
          firstName: firstName.text,
          lastName: lastName.text,
          email: email.text,
          password: passWord.text,
        ),
      );
    }
  }
}
