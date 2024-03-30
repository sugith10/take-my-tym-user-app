import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class ConstraintsBoxTextFormField extends StatelessWidget {
  final String text;
  final MyAppDarkColor darkColor;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const ConstraintsBoxTextFormField({
    required this.controller,
    required this.keyboardType,
    required this.text,
    required this.darkColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: darkColor.primaryTextSoft,
              ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                MyAppRadius.borderRadius - 2,
              ),
              borderSide: BorderSide(color: darkColor.boxShadow),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                MyAppRadius.borderRadius - 2,
              ),
              borderSide: BorderSide(color: darkColor.boxShadow),
            ),
            hintText: text,
            hintStyle: Theme.of(context).textTheme.bodyLarge,
          ),
           style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
