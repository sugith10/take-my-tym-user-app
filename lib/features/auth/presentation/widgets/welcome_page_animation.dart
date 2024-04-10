import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/utils/app_images.dart';

class WelcomePageAnimation extends StatelessWidget {
  const WelcomePageAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.7,
      child: Lottie.asset(MyAppImages.onboardingLottie,
      repeat: false,
          fit: BoxFit.cover),
    );
  }
}
