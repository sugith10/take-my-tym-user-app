import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class ShimmerEffectWidget extends StatelessWidget {
  const ShimmerEffectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerPro.text(
          maxLine: 5,
          light: ShimmerProLight.lighter,
          width: 450,
          scaffoldBackgroundColor: MyAppDarkColor().background,
        ),
        SizedBox(height: 10.h),
        ShimmerPro.text(
          maxLine: 5,
          light: ShimmerProLight.lighter,
          width: 450,
          scaffoldBackgroundColor: MyAppDarkColor().background,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}