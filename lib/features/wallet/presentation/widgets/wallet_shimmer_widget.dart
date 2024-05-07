import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/shimmer_common_widget.dart';

class WalletShimmerWidget extends StatelessWidget {
  const WalletShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        HomePadding(
          child: ShimmerPro.sized(
            light: ShimmerProLight.lighter,
            scaffoldBackgroundColor: AppDarkColor.instance.background,
            height: 150.h,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        ShimmerPro.generated(
          light: ShimmerProLight.lighter,
          scaffoldBackgroundColor: Colors.transparent,
          child: Column(
            children: List.generate(
              3,
              (index) => const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ShimmerCommonWidget(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
