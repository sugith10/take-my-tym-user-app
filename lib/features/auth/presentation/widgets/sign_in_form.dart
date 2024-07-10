import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/reg_exp.dart';
import 'sign_text_form_field.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? errorMsg;
  final GlobalKey<FormState> formKey;
  const SignInForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      this.errorMsg,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SignTextField(
            fadeInDelay: 700,
            fadeInDuration: 800,
            controller: emailController,
            hintText: "Email",
            obsecureText: false,
            showSuffixIcon: false,
            errorMsg: errorMsg,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.mail_outline_rounded,
            validator: (val) {
              if (val!.isEmpty) {
                return "Please fill in this Field";
              } else if (RegExpUtil.emailRexExp.hasMatch(val)) {
                return "Please enter a valid email";
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          SignTextField(
            fadeInDelay: 650,
            fadeInDuration: 750,
            controller: passwordController,
            hintText: "Password",
            obsecureText: true,
            errorMsg: errorMsg,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icons.password_rounded,
            showSuffixIcon: true,
            validator: (val) {
              if (val!.isEmpty) {
                return "Please fill in this Field.";
              } else if (val.length < 6) {
                return "Password should be at least 6 characters long.";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
