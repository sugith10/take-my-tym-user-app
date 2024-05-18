import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/theme/app_colors.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';

import '../../../../core/widgets/home_padding.dart';

class AboutWidget extends StatelessWidget {
  final String about;
  const AboutWidget({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return AuthPadding(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePadding(
              child: Text(
                "About",
                style: Theme.of(context).textTheme.bodySmall,
              ),
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
