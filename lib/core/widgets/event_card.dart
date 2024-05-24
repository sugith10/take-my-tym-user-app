import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/theme/color/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final String title;
  const EventCard({
    required this.isPast,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppDarkColor.instance.lightBackground,
        borderRadius: BorderRadius.circular(AppRadius.borderRadius),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: isPast
                  ? AppDarkColor.instance.primaryTextSoft
                  : AppDarkColor.instance.secondaryText,
              fontSize: MediaQuery.of(context).size.width * 0.0325.sp,
            ),
      ),
    );
  }
}
