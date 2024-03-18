import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_up_page.dart';
import 'package:take_my_tym/features/auth/presentation/util/reg_exp.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/forgot_password_widget.dart';
import 'package:take_my_tym/core/widgets/navigation_taxt_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/singin_textfield.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/social_auth_widget.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';
import 'package:take_my_tym/features/home/presentation/pages/home_page.dart';

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
  final SignInBloc _bloc = SignInBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController;
    _passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        if (state is LoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            },
          );
        }
        if (state is SignInSuccessState) {
          log('succes');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NavigationMenu()),
          );
        }
        if (state is ErrorState) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
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
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: WelcomeTextWidget(
                        firstLine: 'Let\'s Sign You In',
                        secondLine: 'Welcome back.',
                        thirdLine: 'You\'ve been missed!',
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 40.h),
                          SignTextField(
                            fadeInDelay: 700,
                            fadeInDuration: 800,
                            controller: _emailController,
                            hintText: "Email",
                            obsecureText: false,
                            errorMsg: _errorMsg,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.mail_outline_rounded),
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
                            prefixIcon: const Icon(Icons.password_rounded),
                            suffixIcon:  IconButton(onPressed: (){}, icon: const 
                            Icon(Icons.remove_red_eye)),
                            validator: (val) {
                              if (val!.isEmpty) {
                                log(val);
                                return "Please fill in this Field.";
                              } else if (val.length < 6) {
                                return "Password should be at least 6 characters long.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.h),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ForgotPasswordWidget(
                              function: () {},
                            ),
                          ),
                          SizedBox(height: 25.h),
                          SignButtonWidget(
                            title: 'Log In',
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const NavigationMenu()));
                              // if (_formKey.currentState!.validate()) {
                              //   log(_emailController.text);
                              //   log(_passwordController.text);

                              //   // submitCredentials();
                              // } else {
                              //   log("not validated");
                              // }
                            },
                          ),
                          SizedBox(height: 50.h),
                          SocialAuthWidget(
                            function: () {
                              log("social log");
                            },
                          ),
                          SizedBox(height: 40.h),
                          //  const Spacer(),
                          NavigationText(
                            leadingText: 'Don\'t have an account?',
                            buttonText: 'Register',
                            function: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }

  void submitCredentials() {
    log("submited data to bloc");

    _bloc.add(AuthSignInEvent(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }
}
