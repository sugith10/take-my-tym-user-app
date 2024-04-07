import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sub_page_info_widget.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final TextEditingController _fieldOneCntrl = TextEditingController();
final TextEditingController _fieldTwoCntrl = TextEditingController();
final TextEditingController _fieldThreeCntrl = TextEditingController();
final TextEditingController _fieldFourCntrl = TextEditingController();
  @override
  void dispose() {
    _fieldOneCntrl.dispose();
    _fieldTwoCntrl.dispose();
    _fieldThreeCntrl.dispose();
    _fieldFourCntrl.dispose();
    super.dispose();
  }

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

                // Form(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //        EmailVerifyTextField(
                //         onSaved: "pin1",
                //         controller: _fieldOneCntrl,
                //       ),
                //       EmailVerifyTextField(
                //         onSaved: "pin2",
                //         controller: _fieldTwoCntrl,
                //       ),
                //        EmailVerifyTextField(
                //         onSaved: "pin3",
                //         controller: _fieldThreeCntrl,
                //       ),
                //        EmailVerifyTextField(
                //         onSaved: "pin4",
                //         controller: _fieldFourCntrl,
                //       ),
                //     ],
                //   ),
                // ),