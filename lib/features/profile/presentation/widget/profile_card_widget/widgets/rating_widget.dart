import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/const/app_radius.dart';

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
          borderRadius: BorderRadius.circular(AppRadius.borderRadius),),
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 2.w),
            _StarIcon(fill: firstStar),
            _StarIcon(fill: secondStar),
            _StarIcon(fill: thirdStar),
            _StarIcon(fill: fourthStar),
            _StarIcon(fill: fifthStar),
            SizedBox(width: 2.w),
          ],
        ),
      ),
    );
  }
}

class _StarIcon extends StatelessWidget {
  final bool fill;
  const _StarIcon({
    required this.fill,
  });

  @override
  Widget build(BuildContext context) {
    return fill
        ? Icon(
            Icons.star_rate_rounded,
            color: Colors.yellow,
            size: 15.h,
          )
        : Icon(
            Icons.star_border_rounded,
            color: Colors.yellow,
            size: 15.h,
          );
  }
}
