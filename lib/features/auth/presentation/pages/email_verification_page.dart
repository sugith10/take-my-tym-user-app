import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/auth_progress_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button_text.dart';

import '../../../../core/model/app_user_model.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/auth_padding.dart';
import '../../../profile/presentation/page/profile_setup_page.dart';
import '../bloc/verify_user_bloc/verify_user_bloc.dart';
import '../widgets/sign_button.dart';
import '../widgets/sub_page_info_widget.dart';

class EmailVerificationPage extends StatefulWidget {
  final UserModel userModel;

  const EmailVerificationPage({
    super.key,
    required this.userModel,
  });
  static route({required UserModel userModel}) => MaterialPageRoute(
        builder: (context) => EmailVerificationPage(
          userModel: userModel,
        ),
      );

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final VerifyUserBloc _verifyUserBloc = VerifyUserBloc()
    ..add((SendVerificationEmailEvent()));

  @override
  void dispose() {
    _verifyUserBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _verifyUserBloc,
      listener: (context, state) {
        
        if (state is VerifyUserEmailSendState) {
          AppSnackBar().successSnackBar(
            context: context,
            title: "Email Send Succesfully",
            message:
                "We send a email verifcation to user given email id. Please verify the email.",
          );
        }
        if (state is VerifyUserFailedState) {
          AppSnackBar.failSnackBar(context: context, error: state.error);
        }
        if (state is VerifyUserNotFoundState) {
          AppSnackBar.failSnackBar(
            context: context,
            error: state.error,
          );
        }
        if (state is VerifyUserSuccessState) {
          widget.userModel.verified = true;
          Navigator.pushAndRemoveUntil(
            context,
            ProfileSetupPage.route(userModel: widget.userModel),
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
                    animate: false,
                    callback: () {
                      _verifyUserBloc.add(CheckVerificationEvent());
                    },
                    buttonChild: BlocBuilder(
                        bloc: _verifyUserBloc,
                        builder: (context, state) {
                          if (state is VerifyUserLoadingState) {
                            return const AuthProgressWidget();
                          }
                          return const SignButtonText(
                              title: "Please Verify Account");
                        }),
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
