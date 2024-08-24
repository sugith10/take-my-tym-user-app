import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Where Time Meets Oppurtunity",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                letterSpacing: .3,
                fontSize: 16.sp,
              ),
        ),
        const SizedBox(height: 20),
        FittedBox(
          child: Text(
            "TAKEMYTYM",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: MediaQuery.of(context).size.width * 0.15,
                  letterSpacing: 10,
                ),
          ),
        ),
      ],
    );
  }
}
