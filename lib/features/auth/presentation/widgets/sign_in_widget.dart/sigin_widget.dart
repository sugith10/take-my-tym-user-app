import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:iconly/iconly.dart';

class SignInWelcome extends StatelessWidget {
  final String firstLine;
  final String secondLine;
  final String thirdLine;
  const SignInWelcome({
    required this.firstLine,
    required this.secondLine,
    required this.thirdLine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        FadeInDown(
          delay: const Duration(milliseconds: 900),
          duration: const Duration(milliseconds: 1000),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              IconlyBroken.arrow_left,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        FadeInDown(
          delay: const Duration(milliseconds: 800),
          duration: const Duration(milliseconds: 900),
          child: Text(
            firstLine,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        FadeInDown(
          delay: const Duration(milliseconds: 700),
          duration: const Duration(milliseconds: 800),
          child: Text(
            secondLine,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        FadeInDown(
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 700),
          child: Text(
            thirdLine,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
