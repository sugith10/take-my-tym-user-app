import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym/core/utils/app_images.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 5,
            child: LottieBuilder.asset(
              MyAppImages.onboardingLottie,
              fit: BoxFit.cover,
            ),
          )
        ],
      )),
    );
  }
}
