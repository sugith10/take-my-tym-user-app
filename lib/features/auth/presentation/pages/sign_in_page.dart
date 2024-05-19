import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/theme/app_colors.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button_text.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/navigation/screen_transitions/no_movement.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/auth_padding.dart';
import '../../../navigation_menu/presentation/pages/home_navigation_menu.dart';
import '../../../profile/presentation/page/profile_setup_page.dart';
import '../bloc/sign_in_bloc/sign_in_bloc.dart';
import '../widgets/animate_navigation_text.dart';
import '../widgets/auth_progress_widget.dart';
import '../widgets/forgot_password_widget.dart';
import '../widgets/sign_button.dart';
import '../widgets/sign_in_form.dart';
import '../widgets/social_auth/social_auth_widget.dart';
import '../widgets/terms_and_conditions_widget.dart';
import '../widgets/welcome_text_widget.dart';
import 'forget_password_page.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  static route() => noMovement(const SignInPage());
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
    return BlocListener<SignInBloc, SignInState>(
      bloc: _signInBloc,
      listener: (ctx, state) {
        if (state is SignInErrorState) {
          AppSnackBar.failSnackBar(
            context: context,
            error: state.error,
          );
        }
        if (state is SignInSuccessState) {
          if (state.profileSetupComp) {
            context
                .read<AppUserBloc>()
                .add(UpdateUserModelEvent(userModel: state.userModel));

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeNavigationMenu()),
              (route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              ProfileSetupPage.route(userModel: state.userModel),
              (route) => false,
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
                    Navigator.push(context, ForgetPasswordPage.route());
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
                          if (state is SignInLoadingState) {
                            return const AuthProgressWidget();
                          }
                          if (state is SignInSuccessState) {
                            return const AuthProgressWidget();
                          }
                          return const SignButtonText(title: 'LOG IN');
                        },
                      )),
                  SizedBox(height: 15.h),
                  AnimatedNavigationText(
                    leadingText: 'Don\'t have an account?',
                    buttonText: 'Register',
                    callback: () {
                      Navigator.push(
                        context,
                        SignUpPage.route(),
                      );
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
