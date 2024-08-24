import 'package:flutter/material.dart';

import '../../../../core/const/app_padding.dart';


class PoweredByGoogleText extends StatelessWidget {
  const PoweredByGoogleText({super.key});

  @override
  Widget build(BuildContext context) {
    TextSpan googleText({required String text, required Color color}) {
      return TextSpan(
        text: text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              letterSpacing: 1,
            ),
      );
    }

    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(AppPading.authPadding),
          child: RichText(
            text: TextSpan(
              text: 'powerd by ',
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                googleText(
                  text: "G",
                  color: const Color.fromARGB(255, 66, 134, 244),
                ),
                googleText(
                  text: "o",
                  color: const Color.fromARGB(255, 220, 83, 70),
                ),
                googleText(
                  text: "o",
                  color: const Color(0xFFFBB034),
                ),
                googleText(
                  text: "g",
                  color: const Color.fromARGB(255, 66, 134, 244),
                ),
                googleText(
                  text: "l",
                  color: const Color(0xFF34A853),
                ),
                googleText(
                  text: "e",
                  color: const Color.fromARGB(255, 220, 83, 70),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
