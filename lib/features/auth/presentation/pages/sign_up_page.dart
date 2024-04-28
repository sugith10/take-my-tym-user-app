import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/no_movement.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/navigation_taxt_button.dart';
import 'package:take_my_tym/core/widgets/show_loading_dialog.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/pages/email_verification_page.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/social_auth/social_auth_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/terms_and_conditions_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/welcome_text_widget.dart';

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
            ShowLoadingDialog().showLoadingIndicator(context);
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
            SnackBarMessenger().showSnackBar(
              context: context,
              errorDescription: state.message,
              errorMessage: state.title,
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
