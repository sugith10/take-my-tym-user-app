import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final Function function;
  const ForgotPasswordWidget({
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 700),
      duration: const Duration(milliseconds: 800),
      child: InkWell(
        onTap: (){
          function();
        },
        child: Text(
          "Forgot password?",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
