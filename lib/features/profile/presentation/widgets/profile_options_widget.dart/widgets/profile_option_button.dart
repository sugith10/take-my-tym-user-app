import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:take_my_tym/core/utils/app_radius.dart';

class ProfileOptionButton extends StatelessWidget {
  final String action;
  const ProfileOptionButton({
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyAppRadius.borderRadius - 5),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Text(
          action,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 15.5.sp,
              ),
        ),
      ),
    );
  }
}