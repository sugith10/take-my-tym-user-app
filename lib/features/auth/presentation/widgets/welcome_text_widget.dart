import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_back_button.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
       const SignBackButton(),
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


