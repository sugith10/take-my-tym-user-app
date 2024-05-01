import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/verify_user_bloc/verify_user_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sub_page_info_widget.dart';
import 'package:take_my_tym/features/profile/presentation/pages/profile_setup_page.dart';

class EmailVerificationPage extends StatelessWidget {
  final AppUserModel userModel;

  EmailVerificationPage({
    super.key,
    required this.userModel,
  });
  static route({required AppUserModel userModel}) => MaterialPageRoute(
        builder: (context) => EmailVerificationPage(
          userModel: userModel,
        ),
      );

  final VerifyUserBloc _bloc = VerifyUserBloc()
    ..add((SendVerificationEmailEvent()));

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        log(state.toString());
        if (state is EmailSendSuccessState) {
          AppSnackBar().successSnackBar(
            context: context,
            title: "Email Send Succesfully",
            message:
                "We send a email verifcation to user given email id. Please verify the email.",
          );
        }
        if (state is VerificationFailedState) {
          AppSnackBar.failSnackBar (
            context: context,
           error: state.error
          );
        }

        if (state is UserNotVerifiedState) {
          AppSnackBar.failSnackBar (
            context: context,
           error: state.error,
          );
        }

        if (state is UserVerificationSuccessState) {
          userModel.verified = true;
          Navigator.pushAndRemoveUntil(
            context,
           ProfileSetupPage.route(userModel: userModel),
            (route) => false,
          );
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
