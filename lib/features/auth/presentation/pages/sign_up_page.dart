import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/util/reg_exp.dart';
import 'package:take_my_tym/core/widgets/navigation_taxt_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_back_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/singin_textfield.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/social_auth_widget.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:take_my_tym/features/home/presentation/pages/home_page.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _errorMsg;
  final _formKey = GlobalKey<FormState>();
  final _firstNameCntrl = TextEditingController();
  final _lastNameCntrl = TextEditingController();
  final _emailCntrl = TextEditingController();
  final _passwordCntrl = TextEditingController();
  final _confirmPasswordCntrl = TextEditingController();
  final SignUpBloc _bloc = SignUpBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firstNameCntrl;
    _lastNameCntrl;
    _emailCntrl;
    _passwordCntrl;
    _confirmPasswordCntrl;
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
        if (state is SignUpSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NavigationMenu()
            ),
          );
        }
        if (state is ErrorState) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: MyAppPadding.authPadding, right: MyAppPadding.authPadding),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                   const Align(
                      alignment: Alignment.bottomLeft,
                      child: WelcomeTextWidget(
                        firstLine: 'Let\'s Sign You In',
                        secondLine: 'Welcome back.',
                        thirdLine: 'You\'ve been missed!',
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SignTextField(
                                  fadeInDelay: 800,
                                  fadeInDuration: 900,
                                  controller: _firstNameCntrl,
                                  hintText: "First Name",
                                  obsecureText: false,
                                  errorMsg: _errorMsg,
                                  keyboardType: TextInputType.name,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please fill in this Field";
                                    } else if (!nameRexExp.hasMatch(val)) {
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: SignTextField(
                                  fadeInDelay: 800,
                                  fadeInDuration: 900,
                                  controller: _lastNameCntrl,
                                  hintText: "Last Name",
                                  obsecureText: false,
                                  errorMsg: _errorMsg,
                                  keyboardType: TextInputType.name,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please fill in this Field";
                                    } else if (!nameRexExp.hasMatch(val)) {
                                      return "Please enter a valid email";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          SignTextField(
                            fadeInDelay: 700,
                            fadeInDuration: 800,
                            controller: _emailCntrl,
                            prefixIcon: const Icon(Icons.mail_outline_rounded),
                            hintText: "Email",
                            obsecureText: false,
                            errorMsg: _errorMsg,
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please fill in this Field";
                              } else if (!emailRexExp.hasMatch(val)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.h),
                          SignTextField(
                            fadeInDelay: 650,
                            fadeInDuration: 750,
                            controller: _passwordCntrl,
                            hintText: "Password",
                            obsecureText: true,
                            errorMsg: _errorMsg,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.password_rounded),
                            suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.remove_red_eye)),
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
                          SizedBox(height: 10.h),
                          SignTextField(
                            fadeInDelay: 625,
                            fadeInDuration: 725,
                            controller: _confirmPasswordCntrl,
                            hintText: "Confirm Password",
                            obsecureText: true,
                            errorMsg: _errorMsg,
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.password_rounded),
                            suffixIcon:  IconButton(onPressed: (){}, icon: const Icon(Icons.remove_red_eye)),
                            validator: (val) {
                              if (val!.isEmpty) {
                                log(val);
                                return "Please fill in this Field.";
                              } else if (val.length < 6) {
                                return "Password should be at least 6 characters long.";
                              } else if (val != _passwordCntrl.text) {
                                return "Password not matched.";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 25.h),
                          SignButtonWidget(
                            title: 'Create Account',
                            function: () {
                              if (_formKey.currentState!.validate()) {
                                log(_firstNameCntrl.text);
                                log(_lastNameCntrl.text);
                                log(_emailCntrl.text);
                                log(_passwordCntrl.text);

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
                            function: () {},
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
                            function: () {},
                          ),
                          const SizedBox(height: 20),
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

    _bloc.add(CreateUser(
      firstName: _firstNameCntrl.text,
      lastName: _lastNameCntrl.text,
      email: _emailCntrl.text,
      password: _passwordCntrl.text,
    ));
  }
}
