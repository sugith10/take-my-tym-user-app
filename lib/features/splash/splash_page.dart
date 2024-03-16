import 'dart:async';
import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/svg_image_widget.dart';
import 'package:take_my_tym/features/auth/presentation/pages/welcome_page.dart';
import 'package:take_my_tym/features/oboarding/presentation/pages/onboarding_page/oboarding_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        ),
      );
    });
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(50),
            child: SVGImageWidget(
      asset: MyAppImages.onboarding,
      height: 40,
    ),
          ),
        ],
      ),
    );
  }
}
