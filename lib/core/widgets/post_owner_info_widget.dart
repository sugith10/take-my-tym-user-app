import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/time_stamp_to_date.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';

class PostOwnerInfoWidget extends StatelessWidget {
  final String image;
  final String name;
  final Timestamp date;

  const PostOwnerInfoWidget({
    required this.image,
    required this.name,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        children: [
          const CircleProfilePicWidget(
            height: 60,
            width: 60,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 5.h),
              Text(
                timestampToDate(date),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
