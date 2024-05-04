import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

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
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppDarkColor.instance.softBackground,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
