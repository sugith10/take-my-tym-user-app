import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';

import '../../../../../core/util/reg_exp.dart';
import '../sign_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCntrl;
  final String? errorMsg;

  final TextEditingController emailCntrl;
  final TextEditingController passwordCntrl;
  final TextEditingController confirmPasswordCntrl;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.nameCntrl,
    required this.errorMsg,
    required this.emailCntrl,
    required this.passwordCntrl,
    required this.confirmPasswordCntrl,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SignTextField(
            
            fadeInDelay: 700,
            fadeInDuration: 800,
            controller: nameCntrl,
            prefixIcon: Icons.person_2_outlined,
            hintText: "User Name",
            obsecureText: false,
            showSuffixIcon: false,
            errorMsg: errorMsg,
            keyboardType: TextInputType.name,
            validator: ValidationBuilder()
                .minLength(3)
                .maxLength(15)
                .regExp(RegExpUtil.nameRexExp, "Please enter a valid name")
                .build(),
          ),
          SizedBox(height: 10.h),
          SignTextField(
            fadeInDelay: 675,
            fadeInDuration: 750,
            controller: emailCntrl,
            prefixIcon: Icons.mail_outline_rounded,
            hintText: "Email",
            obsecureText: false,
            showSuffixIcon: false,
            errorMsg: errorMsg,
            keyboardType: TextInputType.emailAddress,
            validator: ValidationBuilder().email().maxLength(50).build(),
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
            prefixIcon: Icons.password_rounded,
           
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
            prefixIcon: Icons.password_rounded,
          
          ),
        ],
      ),
    );
  }
}
