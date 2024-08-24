import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/app_box_widget.dart';

class AppTitleBoxWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const AppTitleBoxWidget({
    super.key,
    required this.child,
    required this.title,
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
        AppBoxWidget(
          child: child,
        ),
      ],
    );
  }
}