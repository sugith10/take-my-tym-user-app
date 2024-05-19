import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_colors.dart';

class AuthProgressWidget extends StatelessWidget {
  const AuthProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppDarkColor.instance.background,
      ),
    );
  }
}
