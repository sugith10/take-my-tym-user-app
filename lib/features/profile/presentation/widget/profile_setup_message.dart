import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/assets/app_lottie.dart';
import '../../../../core/theme/color/app_colors.dart';

class ProfileSetupMessage extends StatelessWidget {
  final String firstName;
  const ProfileSetupMessage({super.key, required this.firstName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.225,
      child: Center(
        child: Stack(
          children: [
            //welcome message
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 25.h),
                    Text(
                      "Welcome $firstName...",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w800, letterSpacing: .5),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "We are exited to on onboard you.",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                          color: AppDarkColor.instance.primaryTextBlur),
                    ),
                    SizedBox(height: 3.5.h),
                    Text(
                      "Before our journey begins,",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                          color: AppDarkColor.instance.primaryTextBlur),
                    ),
                    SizedBox(height: 3.5.h),
                    Text(
                      "Complete your profile.",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          letterSpacing: .5,
                          color: AppDarkColor.instance.primaryTextBlur),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
            //lottie asset
            Positioned(
              right: -55,
              child: Lottie.asset(
                repeat: false,
                AppLottie.welcome,
                height: 150.h,
                width: 150.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
