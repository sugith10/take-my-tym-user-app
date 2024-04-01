import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SignButtonWidget extends StatelessWidget {
  final String title;
  final Function function;
  final double width;
  final double height;
  final double paddingR;
  final double paddingL;
  final int delay;
  final int duration;
  const SignButtonWidget({
    required this.title,
    required this.function,
    this.width = 80,
    this.height = 60,
    this.paddingL = 0,
    this.paddingR = 0,
    this.delay = 800,
    this.duration = 900,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      duration: Duration(milliseconds: duration),
      child: Padding(
        padding: EdgeInsets.only(
          left: paddingL,
          right: paddingR,
        ),
        child: ElevatedButton(
          onPressed: () {
            function();
          },
          style: ElevatedButton.styleFrom(minimumSize: Size(width, height)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
