import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/screen_transitions/no_movement.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../../core/widgets/navigation_taxt_button.dart';
import '../bloc/sign_up_bloc/sign_up_bloc.dart';
import '../widgets/sign_button.dart';
import '../widgets/sign_up/sign_up_form.dart';
import '../widgets/social_auth/social_auth_widget.dart';
import '../widgets/terms_and_conditions_widget.dart';
import '../widgets/welcome_text_widget.dart';
import 'email_verification_page.dart';
import 'sign_in_page.dart';


class SignUpPage extends StatefulWidget {
  static route() => noMovement(const SignUpPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? errorMsg;
  final _formKey = GlobalKey<FormState>();
  final firstNameCntrl = TextEditingController();
  final lastNameCntrl = TextEditingController();
  final emailCntrl = TextEditingController();
  final passwordCntrl = TextEditingController();
  final confirmPasswordCntrl = TextEditingController();
  final SignUpBloc bloc = SignUpBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameCntrl.dispose();
    lastNameCntrl.dispose();
    emailCntrl.dispose();
    passwordCntrl.dispose();
    confirmPasswordCntrl.dispose();
    bloc;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            LoadingDialog().show(context);
          }
          if (state is SignUpSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              EmailVerificationPage.route(userModel: state.userModel),
              (route) => false,
            );
          }
          if (state is SignUpFailState) {
            Navigator.pop(context);
            AppSnackBar.failSnackBar(
              context: context,
              error: state.error,
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: MyAppPadding.authPadding,
                    right: MyAppPadding.authPadding),
                child: Column(
                  children: [
                    const WelcomeTextWidget(
                      firstLine: 'New Here?',
                      secondLine: 'Welcome aboard.',
                      thirdLine: 'Let\'s get started!',
                    ),
                    SizedBox(height: 25.h),
                    SignUpForm(
                      formKey: _formKey,
                      firstNameCntrl: firstNameCntrl,
                      errorMsg: errorMsg,
                      lastNameCntrl: lastNameCntrl,
                      emailCntrl: emailCntrl,
                      passwordCntrl: passwordCntrl,
                      confirmPasswordCntrl: confirmPasswordCntrl,
                      bloc: bloc,
                    ),
                    SignButtonWidget(
                      title: 'SIGN UP',
                      function: () {
                        firstNameCntrl.text.trim();
                        lastNameCntrl.text.trim();
                        emailCntrl.text.trim();
                        passwordCntrl.text.trim();
                        confirmPasswordCntrl.text.trim();
                        if (_formKey.currentState!.validate()) {
                          if (_formKey.currentState!.validate()) {
                            bloc.add(
                              CreateUserEvent(
                                firstName: firstNameCntrl.text,
                                lastName: lastNameCntrl.text,
                                email: emailCntrl.text,
                                password: passwordCntrl.text,
                              ),
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    NavigationText(
                      leadingText: 'Have an account?',
                      buttonText: 'Login',
                      function: () {
                        Navigator.push(
                          context,
                          SignInPage.route(),
                        );
                      },
                    ),
                    SizedBox(height: 35.h),
                    const SocialAuthWidget(),
                    SizedBox(height: 25.h),
                    const TermsAndConditionsWidget(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
