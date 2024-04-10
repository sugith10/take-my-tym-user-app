import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final String leadingText;
  final String buttonText;
  final Function function;
  final int delay;
  final int duration;

  const NavigationText({
    super.key,
    required this.leadingText,
    required this.buttonText,
    required this.function,
    this.delay = 800,
    this.duration = 900,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay:  Duration(milliseconds: delay),
      duration:  Duration(milliseconds: duration),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: RichText(
          text: TextSpan(
            text: '$leadingText ',
            style: Theme.of(context).textTheme.labelSmall,
            children: [
              TextSpan(
                  text: buttonText,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decorationColor: const Color.fromRGBO(255, 255, 255, 1),
                        decoration: TextDecoration.underline,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
