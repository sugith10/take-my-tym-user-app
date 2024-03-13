import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final String leadingText;
  final String buttonText;
  final Function function;

  const NavigationText({
    super.key,
    required this.leadingText,
    required this.buttonText,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 800),
      duration: const Duration(milliseconds: 900),
      child: GestureDetector(
        onTap: (){
function();
        },
        child: RichText(
          text: TextSpan(
            text: '$leadingText ',
            style: Theme.of(context).textTheme.labelSmall,
            children: [
              TextSpan(
                text: buttonText,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
