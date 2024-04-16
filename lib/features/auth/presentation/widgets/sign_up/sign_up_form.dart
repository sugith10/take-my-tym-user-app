import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/navigation_taxt_button.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/util/reg_exp.dart';
import 'package:take_my_tym/features/auth/presentation/util/sign_up_page_util.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_button.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.firstNameCntrl,
    required this.errorMsg,
    required this.lastNameCntrl,
    required this.emailCntrl,
    required this.passwordCntrl,
    required this.confirmPasswordCntrl,
    required this.bloc,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameCntrl;
  final String? errorMsg;
  final TextEditingController lastNameCntrl;
  final TextEditingController emailCntrl;
  final TextEditingController passwordCntrl;
  final TextEditingController confirmPasswordCntrl;
  final SignUpBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SignTextField(
                  fadeInDelay: 700,
                  fadeInDuration: 800,
                  controller: firstNameCntrl,
                  hintText: "First Name",
                  obsecureText: false,
                  showSuffixIcon: false,
                  errorMsg: errorMsg,
                  keyboardType: TextInputType.name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please fill in this field";
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
                  fadeInDelay: 700,
                  fadeInDuration: 800,
                  controller: lastNameCntrl,
                  hintText: "Last Name",
                  obsecureText: false,
                  showSuffixIcon: false,
                  errorMsg: errorMsg,
                  keyboardType: TextInputType.name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please fill in this field";
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
            fadeInDelay: 675,
            fadeInDuration: 750,
            controller: emailCntrl,
            prefixIcon: const Icon(Icons.mail_outline_rounded),
            hintText: "Email",
            obsecureText: false,
            showSuffixIcon: false,
            errorMsg: errorMsg,
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
            controller: passwordCntrl,
            hintText: "Password",
            obsecureText: true,
            showSuffixIcon: true,
            errorMsg: errorMsg,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: const Icon(Icons.password_rounded),
            validator: (val) {
              if (val!.isEmpty) {
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
            controller: confirmPasswordCntrl,
            hintText: "Confirm Password",
            obsecureText: true,
            showSuffixIcon: true,
            errorMsg: errorMsg,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: const Icon(Icons.password_rounded),
            validator: (val) {
              if (val!.isEmpty) {
               
                return "Please fill in this Field.";
              } else if (val.length < 6) {
                return "Password should be at least 6 characters long.";
              } else if (val != passwordCntrl.text) {
                return "Password not matched.";
              }
              return null;
            },
          ),
          SizedBox(height: 25.h),
          SignButtonWidget(
            title: 'Create Account',
            function: () {
              if (formKey.currentState!.validate()) {
                SignInPageUtil().submitCredentials(
                  bloc: bloc,
                  formKey: formKey,
                  confirmPassword: confirmPasswordCntrl,
                  passWord: passwordCntrl,
                  email: emailCntrl,
                  firstName: firstNameCntrl,
                  lastName: lastNameCntrl,
                );
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

        ],
      ),
    );
  }
}
