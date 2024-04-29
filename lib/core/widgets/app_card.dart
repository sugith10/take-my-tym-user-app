import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class AppCard extends StatelessWidget {
  final VoidCallback voidCallback;
  final double width;
  final double? height;
  final Widget child;
  const AppCard({
    super.key,
    required this.voidCallback,
    required this.width,
     this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        voidCallback();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: MyAppPadding.homePadding,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: MyAppDarkColor.instance.secondaryBackground,
            borderRadius: BorderRadius.circular(
              MyAppRadius.borderRadius,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              MyAppRadius.borderRadius,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
