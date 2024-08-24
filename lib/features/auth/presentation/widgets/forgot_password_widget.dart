import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final VoidCallback callback;
  const ForgotPasswordWidget({
    required this.callback,
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
           callback();
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
