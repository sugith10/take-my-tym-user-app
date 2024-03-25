import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_card_widget/widgets/profile_location_widget.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_card_widget/widgets/rating_widget.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: HomePadding(
        child: Row(
          children: [
            SizedBox(width: 15.h),
            //Section 1 begin
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const ProfileNameWidget(name:  'Sugith K'),
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

                  const ProfileLocationWidget(
                    location: 'Calicut, Kerala',
                  ),
                  //location end
                ],
              ),
            ),
            //Section 1 ends
            const Spacer(),
            //Section 2 begin
            const CircleProfilePicWidget(
              height: 100,
              width: 100,
              image: MyAppImages.testProfile,
            ),

            //Section 2 ends
            SizedBox(width: 20.h),
          ],
        ),
      ),
    );
  }
}

class ProfileNameWidget extends StatelessWidget {
  final String name;
  const ProfileNameWidget({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
     name,
      style: Theme.of(context).textTheme.displayMedium,
      overflow: TextOverflow.fade,
      maxLines: 2,
    );
  }
}
