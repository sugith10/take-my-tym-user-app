import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets/app_svg.dart';

class CoustomerServiceFab extends StatelessWidget {
  final VoidCallback callback;
  const CoustomerServiceFab({
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 5,
      onPressed: () {
        callback();
      },
      label: Row(
        children: [
          SvgPicture.asset(AppSvg.customerSupport),
          SizedBox(width: 10.w),
          Text(
            "Customer Service",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
