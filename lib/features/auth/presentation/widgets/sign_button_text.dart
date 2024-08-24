import 'package:flutter/material.dart';

import '../../../../core/theme/color/app_colors.dart';

class SignButtonText extends StatelessWidget {
  const SignButtonText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppDarkColor.instance.softBackground,
          ),
    );
  }
}