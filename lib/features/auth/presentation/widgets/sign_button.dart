import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SignButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final bool animate;
  final Widget buttonChild;

  const SignButtonWidget({
    required this.title,
    required this.callback,
    required this.buttonChild,
    this.animate = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: animate ? 800 : 0),
      duration: Duration(milliseconds: animate ? 900 : 0),
      child: ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          callback();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buttonChild],
        ),
      ),
    );
  }
}
