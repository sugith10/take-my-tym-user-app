import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/app_assets/app_lottie.dart';

class NoMessageWidget extends StatelessWidget {
  const NoMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 1),
        Lottie.asset(AppLottie.msg),
        Text(
          "No messages yet",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 5),
        Text(
          "You'll find your conversations all right here.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
