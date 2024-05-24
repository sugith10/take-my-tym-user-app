import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:take_my_tym/core/utils/theme/color/app_colors.dart';

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
          scaffoldBackgroundColor: AppDarkColor.instance.background,
        ),
        SizedBox(height: 10.h),
        ShimmerPro.generated(
          light: ShimmerProLight.lighter,
          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              ShimmerPro.sized(
                light: ShimmerProLight.lighter,
                scaffoldBackgroundColor: AppDarkColor.instance.background,
                height: 150,
                width: 400,
              ),
              ShimmerPro.text(
                maxLine: 5,
                light: ShimmerProLight.lighter,
                width: 450,
                scaffoldBackgroundColor: AppDarkColor.instance.background,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        ShimmerPro.text(
          maxLine: 6,
          light: ShimmerProLight.lighter,
          width: 450,
          scaffoldBackgroundColor: AppDarkColor.instance.background,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
