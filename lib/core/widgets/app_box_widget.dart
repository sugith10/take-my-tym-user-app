import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';

class AppBoxWidget extends StatelessWidget {
  final double? height;
  
  final Widget child;
  const AppBoxWidget({
    super.key,
     this.height,
    required this.child,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: AppDarkColor.instance.secondaryBorder,
        ),
        borderRadius: BorderRadius.circular(
          MyAppRadius.borderRadius,
        ),
      ),
      child: HomePadding(
        child: child,
      ),
    );
  }
}