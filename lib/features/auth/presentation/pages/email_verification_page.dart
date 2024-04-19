import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/verify_user_bloc/verify_user_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sub_page_info_widget.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final VerifyUserBloc _bloc = VerifyUserBloc()
    ..add((SendVerificationEmailEvent()));

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        log(state.toString());
        if (state is EmailSendSuccessState) {
          SnackBarMessenger().successSnackBar(
            context: context,
            title: "Email Send Succesfully",
            message:
                "We send a email verifcation to user given email id. Please verify the email.",
          );
        }
        if (state is VerificationFailedState) {
          SnackBarMessenger().showSnackBar(
            context: context,
            errorMessage: state.title,
            errorDescription: state.message,
          );
        }

        if (state is UserNotVerifiedState) {
          SnackBarMessenger().showSnackBar(
            context: context,
            errorMessage: "The user Not Verified",
            errorDescription:
                "We send a email verifcation to user given email id. Please verify the email.",
          );
        }

        if (state is UserVerificationSuccessState) {
          context.read<AppUserBloc>().appUserModel!.verified = true;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const NavigationMenu()),
              (route) => false);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: AuthPadding(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SubPageInfoWidget(
                    title: 'Please Verify Account',
                    content:
                        "We have just send email verification link on your email. Please check email and click on that link to verify your Email address.\n\nIf not auto redirected after verification, click on the Continue button.",
                  ),
                  SignButtonWidget(
                    title: 'Continue',
                    delay: 0,
                    duration: 0,
                    function: () {
                      _bloc.add(CheckVerificationEvent());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
