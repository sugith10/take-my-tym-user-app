import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/navigation_taxt_button.dart';

class AnimatedNavigationText extends StatelessWidget {
  final String leadingText;
  final String buttonText;
  final VoidCallback callback;

  const AnimatedNavigationText({
    super.key,
    required this.leadingText,
    required this.buttonText,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 800),
      duration: const Duration(milliseconds: 900),
      child: NavigationText(
        leadingText: leadingText,
        buttonText: buttonText,
        callback: () {
          callback();
        },
      ),
    );
  }
}
