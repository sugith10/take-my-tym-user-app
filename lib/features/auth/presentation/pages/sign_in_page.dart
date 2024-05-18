import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/navigation/screen_transitions/no_movement.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/reg_exp.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../../core/widgets/navigation_taxt_button.dart';
import '../../../navigation_menu/presentation/pages/home_navigation_menu.dart';
import '../../../profile/presentation/page/profile_setup_page.dart';
import '../bloc/sign_in_bloc/sign_in_bloc.dart';
import '../widgets/forgot_password_widget.dart';
import '../widgets/sign_button.dart';
import '../widgets/sign_text_form_field.dart';
import '../widgets/social_auth/social_auth_widget.dart';
import '../widgets/terms_and_conditions_widget.dart';
import '../widgets/welcome_text_widget.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  static route() => noMovement(const SignInPage());
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _errorMsg;
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final SignInBloc _signInBloc = SignInBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    formKey;
    _emailController.dispose();
    _passwordController.dispose();
    _signInBloc.close();
    super.dispose();
  }

  void submitCredentials() {
    _signInBloc.add(
      LogInEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      bloc: _signInBloc,
      listener: (ctx, state) {
        if (state is SignInLoadingState) {
          LoadingDialog().show(context);
        }
        if (state is SignInErrorState) {
          Navigator.pop(context);
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
            child: Padding(
              padding: const EdgeInsets.only(
                left: MyAppPadding.authPadding,
                right: MyAppPadding.authPadding,
              ),
              child: Column(
                children: [
                  const WelcomeTextWidget(
                    firstLine: 'Let\'s Sign You In',
                    secondLine: 'Welcome back.',
                    thirdLine: 'You\'ve been missed!',
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        SignTextField(
                          fadeInDelay: 700,
                          fadeInDuration: 800,
                          controller: _emailController,
                          hintText: "Email",
                          obsecureText: false,
                          showSuffixIcon: false,
                          errorMsg: _errorMsg,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.mail_outline_rounded,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this Field";
                            } else if (!emailRexExp.hasMatch(val)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        SignTextField(
                          fadeInDelay: 650,
                          fadeInDuration: 750,
                          controller: _passwordController,
                          hintText: "Password",
                          obsecureText: true,
                          errorMsg: _errorMsg,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Icons.password_rounded,
                          showSuffixIcon: true,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this Field.";
                            } else if (val.length < 6) {
                              return "Password should be at least 6 characters long.";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h),
                        const ForgotPasswordWidget(),
                        SizedBox(height: 25.h),
                        SignButtonWidget(
                          title: 'LOG IN',
                          function: () {
                            if (formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              submitCredentials();
                            }
                          },
                        ),
                        SizedBox(height: 15.h),
                        NavigationText(
                          leadingText: 'Don\'t have an account?',
                          buttonText: 'Register',
                          function: () {
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
