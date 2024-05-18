import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';

import 'sign_back_button.dart';

class WelcomeTextWidget extends StatelessWidget {
  final String firstLine;
  final String secondLine;
  final String thirdLine;
  const WelcomeTextWidget({
    required this.firstLine,
    required this.secondLine,
    required this.thirdLine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          FadeInDown(
            delay: const Duration(milliseconds: 900),
            duration: const Duration(milliseconds: 1000),
            child: SignBackButton(
              callback: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 15.h),
          FadeInDown(
            delay: const Duration(milliseconds: 800),
            duration: const Duration(milliseconds: 900),
            child: _Text(line: firstLine),
          ),
          SizedBox(height: 10.h),
          FadeInDown(
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 800),
            child: _Text(line: secondLine),
          ),
          SizedBox(height: 10.h),
          FadeInDown(
              delay: const Duration(milliseconds: 600),
              duration: const Duration(milliseconds: 700),
              child: _Text(line: thirdLine)),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  final String line;
  const _Text({
    required this.line,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      line,
      style: Theme.of(context)
          .textTheme
          .displayLarge
          ?.copyWith(fontSize: MediaQuery.of(context).size.width * 0.055.sp),
    );
  }
}
