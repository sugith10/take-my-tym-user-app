import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class AnimatedDot extends StatelessWidget {
  final bool isActive;
  const AnimatedDot({
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive
            ? AppDarkColor.instance.primaryText
            : AppDarkColor.instance.secondaryText,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}