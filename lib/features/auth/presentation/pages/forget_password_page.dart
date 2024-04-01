import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/show_loading_dialog.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/forget_password_bloc/forget_password_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/util/reg_exp.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_back_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_text_form_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ForgetPasswordBloc _forgetPasswordBloc = ForgetPasswordBloc();
  String? _errorMsg;

  @override
  void dispose() {
    _emailController.dispose();
    _formKey;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _forgetPasswordBloc,
      listener: (context, state) {
        if (state is ForgetPasswordLoadingState) {
          ShowLoadingDialog().showLoadingIndicator(context);
        } else if (state is ForgetPasswordSuccessState) {
          Navigator.pop(context);
          Navigator.pop(context);
        } else if (state is ForgetPasswordFailState) {
          Navigator.pop(context);
          SnackBarMessenger().showSnackBar(
            context: context,
            errorMessage: state.message,
            errorDescription: state.description,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: AuthPadding(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: SignBackButton(),
                  ),
                  SizedBox(height: 75.h),
                  Text(
                    'Forget Password',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Enter email addrress accociated with your account and we'll send email with instruction to reset your password",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100.h),
                  SignTextField(
                    fadeInDelay: 0,
                    fadeInDuration: 0,
                    controller: _emailController,
                    hintText: "Email",
                    obsecureText: false,
                    showSuffixIcon: false,
                    errorMsg: _errorMsg,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.mail_outline_rounded),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please fill in this Field";
                      } else if (!emailRexExp.hasMatch(val)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  SignButtonWidget(
                    title: 'Reset Password',
                    function: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        //  log(_emailController.text);
                        _forgetPasswordBloc.add(
                            ForgetPasswordEvent(email: _emailController.text));
                      }
                    },
                    delay: 0,
                    duration: 0,
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
