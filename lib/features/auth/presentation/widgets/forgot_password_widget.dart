import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:take_my_tym/features/auth/presentation/pages/forget_password_page.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FadeInDown(
        delay: const Duration(milliseconds: 700),
        duration: const Duration(milliseconds: 800),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgetPasswordPage()));
          },
          child: Text(
            "Forgot password?",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
