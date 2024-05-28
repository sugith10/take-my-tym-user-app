import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/theme/color/app_colors.dart';
import 'package:take_my_tym/core/const/app_radius.dart';

class CollectInfoTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final TextStyle? style;
  final double gap;
  final Widget? prefixIcon;
  final TextStyle? controllerStyle;
  const CollectInfoTextField({
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.style,
    this.gap = 12.5,
    this.prefixIcon,
    this.controllerStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: style,
        ),
        SizedBox(height: gap.h),
        _CollectInfoTextField(
          controller: controller,
          keyboardType: keyboardType,
          hintText: hintText,
          prefixIcon: prefixIcon,
          controllerStyle: controllerStyle,
        ),
      ],
    );
  }
}

class _CollectInfoTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle? controllerStyle;
  final TextInputType keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  const _CollectInfoTextField({
    this.prefixIcon,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.controllerStyle,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppRadius.borderRadius - 2,
      ),
      borderSide: BorderSide(color: AppDarkColor.instance.boxShadow),
    );
    return TextField(
      autofocus: true,
      maxLines: null,
      controller: controller,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        enabledBorder: border,
        focusedBorder: border,
        hintText: hintText,
      ),
      style: controllerStyle ?? Theme.of(context).textTheme.labelLarge,
    );
  }
}
