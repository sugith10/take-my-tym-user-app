import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_card_widget/widgets/rating_widget/rating_widget.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Section 1
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sugith K',
                  style: Theme.of(context).textTheme.displayMedium,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
                SizedBox(height: 10.h),

                const RatingWidget(
                  firstStar: true,
                  secondStar: true,
                  thirdStar: true,
                  fourthStar: true,
                  fifthStar: true,
                ),
                SizedBox(height: 10.h),
                //location start
                Text(
                  'Calicut, Kerala, India',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                //location end
              ],
            ),
          ),

          //Section 2

          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2.5,
                ),
                shape: BoxShape.circle),
            child: const CircleProfilePicWidget(
              height: 100,
              width: 100,
              image: MyAppImages.testProfile,
            ),
          ),
        ],
      ),
    );
  }
}
