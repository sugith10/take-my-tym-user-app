import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/user_bloc/user_bloc.dart';
import '../../../../core/route/route_name/app_route_name.dart';
import '../../../../core/widgets/app_snackbar/app_snack_bar.dart';
import '../../../../core/widgets/auth_padding.dart';
import '../bloc/sign_in_bloc/sign_in_bloc.dart';
import '../widgets/animate_navigation_text.dart';
import '../widgets/auth_progress_widget.dart';
import '../widgets/forgot_password_widget.dart';
import '../widgets/sign_button.dart';
import '../widgets/sign_button_text.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/social_auth/social_auth_widget.dart';
import '../widgets/terms_and_conditions_widget.dart';
import '../widgets/welcome_text_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _errorMsg;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final SignInBloc _signInBloc = SignInBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _formKey;
    _emailController.dispose();
    _passwordController.dispose();
    _signInBloc.close();
    super.dispose();
  }

  void _submitCredentials() {
    _signInBloc.add(
      SignInEvent(
        email: _emailController.text,
        password: _passwordController.text,
        formKey: _formKey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _signInBloc,
      listener: (ctx, state) {
        if (state is SignInErrorState) {
          AppSnackBar.failSnackBar(
            context: context,
            alert: state.error,
          );
        }
        if (state is SignInSuccessState) {
          if (state.profileSetupComp) {
            context
                .read<UserBloc>()
                .add(UserUpdateEvent(userModel: state.userModel));

            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.home, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteName.profileSetup,
              (route) => false,
              arguments: state.userModel,
            );
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: AuthPadding(
              child: Column(
                children: [
                  const WelcomeTextWidget(
                    firstLine: 'Let\'s Sign You In',
                    secondLine: 'Welcome back.',
                    thirdLine: 'You\'ve been missed!',
                  ),
                  SizedBox(height: 30.h),
                  SignInForm(
                    formKey: _formKey,
                    errorMsg: _errorMsg,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  SizedBox(height: 15.h),
                  ForgotPasswordWidget(callback: () {
                    Navigator.pushNamed(context, RouteName.forgotPassword);
                  }),
                  SizedBox(height: 25.h),
                  SignButtonWidget(
                    title: 'LOG IN',
                    callback: () {
                      _submitCredentials();
                    },
                    buttonChild: BlocBuilder(
                      bloc: _signInBloc,
                      builder: (context, state) {
                        if (state is SignInLoadingState ||
                            state is SignInSuccessState) {
                          return const AuthProgressWidget();
                        }
                        return const SignButtonText(title: 'LOG IN');
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),
                  AnimatedNavigationText(
                    leadingText: 'Don\'t have an account?',
                    buttonText: 'Register',
                    callback: () {
                      Navigator.pushNamed(context, RouteName.signUp);
                    },
                  ),
                  SizedBox(height: 50.h),
                  const SocialAuthWidget(),
                  SizedBox(height: 25.h),
                  const TermsAndConditionsWidget(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
