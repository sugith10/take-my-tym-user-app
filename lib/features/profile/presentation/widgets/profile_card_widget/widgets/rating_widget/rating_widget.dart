import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/features/profile/presentation/widgets/profile_card_widget/widgets/rating_widget/widgets/star_icon.dart';

class RatingWidget extends StatelessWidget {
  final bool firstStar;
  final bool secondStar;
  final bool thirdStar;
  final bool fourthStar;
  final bool fifthStar;
  const RatingWidget({
    required this.firstStar,
    required this.secondStar,
    required this.thirdStar,
    required this.fourthStar,
    required this.fifthStar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0),
          border: Border.all(
            color: const Color.fromRGBO(255, 235, 59, 1),
          ),
          borderRadius: BorderRadius.circular(MyAppRadius.borderRadius)),
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 2.w),
            StarIcon(fill: firstStar),
            StarIcon(fill: secondStar),
            StarIcon(fill: thirdStar),
            StarIcon(fill: fourthStar),
            StarIcon(fill: fifthStar),
            SizedBox(width: 2.w),
          ],
        ),
      ),
    );
  }
}

