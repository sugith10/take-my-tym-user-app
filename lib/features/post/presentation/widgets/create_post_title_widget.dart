import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';

class CreatePostTitleWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const CreatePostTitleWidget({
    required this.children,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: MyAppDarkColor().secondaryBorder,
            ),
            borderRadius: BorderRadius.circular(
              MyAppRadius.borderRadius,
            ),
          ),
          child: HomePadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
