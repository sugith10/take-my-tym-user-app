import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarIcon extends StatelessWidget {
  final bool fill;
  const StarIcon({
    required this.fill,
    super.key,
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
