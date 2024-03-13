import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';

class SocialAuthWidget extends StatelessWidget {
  final Function function;
  const SocialAuthWidget({
    required this.function,
    super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 800),
      duration: const Duration(milliseconds: 900),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or continue with',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: function(),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(238, 238, 238, 1)),
                    child: Center(
                      child: Image.asset(
                        MyAppImages().google,
                        height: 35,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
