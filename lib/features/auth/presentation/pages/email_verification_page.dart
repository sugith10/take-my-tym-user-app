import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sub_page_info_widget.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    FocusScope.of(context).unfocus();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
