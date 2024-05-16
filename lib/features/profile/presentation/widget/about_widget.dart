import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

import '../../../../core/widgets/home_padding.dart';

class AboutWidget extends StatelessWidget {
  final String about;
  const AboutWidget({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return HomePadding(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
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
