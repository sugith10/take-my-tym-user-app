import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class ConstrainTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final double gap;
  const ConstrainTextFormField({
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.style,
    this.validator,
    this.gap = 10,
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
        SizedBox(height: gap),
        _ConstrainTextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          hintText: hintText,
        ),
      ],
    );
  }
}


class _ConstrainTextFormField extends StatelessWidget {
  const _ConstrainTextFormField({

    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.hintText,
  });

  final TextEditingController controller;
  final String? Function(String? p1)? validator;
  final TextInputType keyboardType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
