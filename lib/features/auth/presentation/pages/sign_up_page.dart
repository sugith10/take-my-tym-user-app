import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button_text.dart';

import '../../../../core/navigation/screen_transitions/no_movement.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../profile/presentation/page/profile_setup_page.dart';
import '../bloc/sign_up_bloc/sign_up_bloc.dart';
import '../widgets/animate_navigation_text.dart';
import '../widgets/auth_progress_widget.dart';
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
  String? _errorMsg;
  final _formKey = GlobalKey<FormState>();
  final __firstNameCntrl = TextEditingController();
  final _lastNameCntrl = TextEditingController();
  final _emailCntrl = TextEditingController();
  final _passwordCntrl = TextEditingController();
  final _confirmPasswordCntrl = TextEditingController();
  final SignUpBloc _signUpBloc = SignUpBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    __firstNameCntrl.dispose();
    _lastNameCntrl.dispose();
    _emailCntrl.dispose();
    _passwordCntrl.dispose();
    _confirmPasswordCntrl.dispose();
    _signUpBloc.close();
    super.dispose();
  }

  void submitCredentials() {
    _signUpBloc.add(
      CreateUserEvent(
        formKey: _formKey,
        firstName: __firstNameCntrl.text,
        lastName: _lastNameCntrl.text,
        email: _emailCntrl.text,
        password: _passwordCntrl.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: _signUpBloc,
        listener: (context, state) {
          if (state is SignUpSuccessState) {
             Navigator.pushAndRemoveUntil(
            context,
            ProfileSetupPage.route(userModel: state.userModel),
            (route) => false,
          );
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   EmailVerificationPage.route(userModel: state.userModel),
            //   (route) => false,
            // );
          }
          if (state is SignUpFailState) {
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
                      firstNameCntrl: __firstNameCntrl,
                      errorMsg: _errorMsg,
                      lastNameCntrl: _lastNameCntrl,
                      emailCntrl: _emailCntrl,
                      passwordCntrl: _passwordCntrl,
                      confirmPasswordCntrl: _confirmPasswordCntrl,
                    ),
                    SizedBox(height: 25.h),
                    SignButtonWidget(
                      title: 'SIGN UP',
                      callback: () {
                        submitCredentials();
                      },
                      buttonChild: BlocBuilder(
                          bloc: _signUpBloc,
                          builder: (context, state) {
                            if (state is SignUpLoadingState) {
                              return const AuthProgressWidget();
                            } else if (state is SignUpSuccessState) {
                              return const AuthProgressWidget();
                            }
                            return const SignButtonText(title: 'SIGN UP');
                          }),
                    ),
                    SizedBox(height: 15.h),
                    AnimatedNavigationText(
                      leadingText: 'Have an account?',
                      buttonText: 'Login',
                      callback: () {
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
