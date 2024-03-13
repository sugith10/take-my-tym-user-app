import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/util/reg_exp.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/forgot_password_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/navigation_taxt_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_in_widget.dart/sigin_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/singin_textfield.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/social_auth_widget.dart';
import 'package:take_my_tym/features/home/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          print("succes");
        }
        if (state is SignedSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                user: state.userModel,
              ),
            ),
          );
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
                    left: MyAppPadding.padding, right: MyAppPadding.padding),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.bottomLeft,
                
                      child: SignInWelcome(
                        firstLine: 'Welcome to the market!',
                        secondLine: 'Excited to have you as',
                        thirdLine: 'Part of our community',
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 40.h),
                          SignTextField(
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
                            controller: _passwordController,
                            hintText: "Password",
                            obsecureText: true,
                            errorMsg: _errorMsg,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.password_rounded),
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
                      
                          
                          SizedBox(height: 40.h),
                          SignButtonWidget(
                            title: 'Create Account',
                            function: () {
                              if (_formKey.currentState!.validate()) {
                                log(_emailController.text);
                                log(_passwordController.text);
                          
                                submitCredentials();
                              } else {
                                log("not validated");
                              }
                            },
                          ),
                          SizedBox(height: 15.h),
                          NavigationText(
                            leadingText: 'Have an account?',
                            buttonText: 'Login',
                            function: () {
                              print('hello');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInPage(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 35.h),
                          SocialAuthWidget(
                            function: (){},
                          ),
                          SizedBox(height: 40.h),
                          //  const Spacer(),
                          NavigationText(
                  leadingText: "By proceeding, I accept TakeMyTym's",
                  buttonText: 'T&C',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                ),
                NavigationText(
                  leadingText: "and",
                  buttonText: 'Privacy Policy.',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
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
        email: _emailController.text, password: _passwordController.text));
  }
}
