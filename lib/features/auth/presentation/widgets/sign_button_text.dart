import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class SignButtonText extends StatelessWidget {
  final String text;
  const SignButtonText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: MyAppDarkColor.instance.softBackground,
          ),
    );
  }
}