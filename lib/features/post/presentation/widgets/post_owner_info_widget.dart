import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';

class PostOwnerInfoWidget extends StatelessWidget {
  final String image;
  final String name;
  final String date;

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
          CircleProfilePicWidget(
            height: 60,
            width: 60,
            image: image,
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
                date,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
