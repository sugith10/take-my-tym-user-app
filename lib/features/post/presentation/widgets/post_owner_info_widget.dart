import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';

class PostOwnerInfoWidget extends StatelessWidget {
  const PostOwnerInfoWidget({
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
            image: MyAppImages.testProfile,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dilshad D',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 5.h),
              Text(
                'Oct 15, 2023',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
