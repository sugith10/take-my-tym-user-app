import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class ConstraintsTextFormField extends StatelessWidget {
  final String hintText;
  
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const ConstraintsTextFormField({
    required this.controller,
    required this.keyboardType,
    required this.hintText,

    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: MyAppDarkColor.instance.primaryTextSoft,
              ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          maxLines: null,
          controller: controller,
          textCapitalization: TextCapitalization.words,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                MyAppRadius.borderRadius - 2,
              ),
              borderSide: BorderSide(color: MyAppDarkColor.instance.boxShadow),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                MyAppRadius.borderRadius - 2,
              ),
              borderSide: BorderSide(color: MyAppDarkColor.instance.boxShadow),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
