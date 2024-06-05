import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

import '../../../../core/theme/color/app_colors.dart';

class ChatListShimmerWidget extends StatelessWidget {
  const ChatListShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChatShimmerWidget(),
        ChatShimmerWidget(),
      ],
    );
  }
}

class ChatShimmerWidget extends StatelessWidget {
  final double _borderRadius = 100;
  const ChatShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerPro.generated(
      scaffoldBackgroundColor: AppDarkColor.instance.bottomBar,
      child: Row(
        children: [
          ShimmerPro.sized(
            light: ShimmerProLight.lighter,
            scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            height: 60,
            width: 60,
            borderRadius: _borderRadius,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 25,
                child: FittedBox(
                  child: ShimmerPro.text(
                  
                    light: ShimmerProLight.lighter,
                    scaffoldBackgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    width: 100,
                    maxLine: 1,
                    borderRadius: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 25,
                child: FittedBox(
                  child: ShimmerPro.text(
                    light: ShimmerProLight.lighter,
                    scaffoldBackgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    width: 250,
              
                    maxLine: 1,
                    borderRadius: 10,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
