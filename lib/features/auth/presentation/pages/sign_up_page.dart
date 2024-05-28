import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/const/app_padding.dart';
import '../../../../core/route/page_transition/app_page_transition.dart';
import '../../../../core/route/route_name/app_route_name.dart';
import '../../../../core/widgets/app_snackbar/app_snack_bar.dart';
import '../bloc/sign_up_bloc/sign_up_bloc.dart';
import '../widgets/animate_navigation_text.dart';
import '../widgets/auth_progress_widget.dart';
import '../widgets/sign_button.dart';
import '../widgets/sign_button_text.dart';
import '../widgets/sign_up/sign_up_form.dart';
import '../widgets/social_auth/social_auth_widget.dart';
import '../widgets/terms_and_conditions_widget.dart';
import '../widgets/welcome_text_widget.dart';

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
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteName.profileSetup,
              (route) => false,
              arguments: state.userModel,
            );
          }
          if (state is SignUpFailState) {
            AppSnackBar.failSnackBar(
              context: context,
              alert: state.error,
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: AppPading.authPadding, right: AppPading.authPadding),
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
                        Navigator.pushNamed(context, RouteName.signIn);
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
