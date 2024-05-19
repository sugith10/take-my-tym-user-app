import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final String leadingText;
  final String buttonText;
  final VoidCallback callback;


  const NavigationText({
    super.key,
    required this.leadingText,
    required this.buttonText,
    required this.callback,
  
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
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
                  ),
            )
          ],
        ),
      ),
    );
  }
}
