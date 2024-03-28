import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountInfoContentWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const AccountInfoContentWidget({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(height: 2.h),
        Text(subtitle),
        SizedBox(height: 15.h),
      ],
    );
  }
}