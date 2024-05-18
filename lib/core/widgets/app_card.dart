import 'package:flutter/material.dart';

import '../utils/theme/app_colors.dart';
import '../utils/app_radius.dart';

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
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppDarkColor.instance.secondaryBackground,
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
    );
  }
}
