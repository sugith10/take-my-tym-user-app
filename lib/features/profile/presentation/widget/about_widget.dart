import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/color/app_colors.dart';

class AboutWidget extends StatelessWidget {
  final String about;
  const AboutWidget({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 5.h),
            Text(
              about,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: AppDarkColor.instance.primaryTextSoft),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
