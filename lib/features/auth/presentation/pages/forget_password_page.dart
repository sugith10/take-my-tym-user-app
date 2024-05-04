import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/show_loading_dialog.dart';
import 'package:take_my_tym/core/widgets/app_snack_bar.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/forget_password_bloc/forget_password_bloc.dart';
import 'package:take_my_tym/core/utils/reg_exp.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_text_form_field.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sub_page_info_widget.dart';

class ForgetPasswordPage extends StatefulWidget {
   static route() => MaterialPageRoute(builder: (context)=>  const ForgetPasswordPage());
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
          AppSnackBar.  failSnackBar(
            context: context,
            error:state.error
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
                  const SubPageInfoWidget(
                    title: 'Forget Password',
                    content:
                        "Enter email addrress accociated with your account and we'll send email with instruction to reset your password",
                  ),
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