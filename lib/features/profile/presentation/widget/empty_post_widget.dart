import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/assets/app_lottie.dart';

class EmptyPostWidget extends StatelessWidget {
  const EmptyPostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LottieBuilder.asset(AppLottie.emptyPost),
        Positioned.fill(
          child: Center(
            child: Text(
              "No Post Yet...",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}