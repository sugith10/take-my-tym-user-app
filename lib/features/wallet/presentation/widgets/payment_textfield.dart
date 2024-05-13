import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  const PaymentTextField({
    required this.controller,
    required this.readOnly,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextField(
        autofocus: true,
        controller: controller,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 45.sp,
              fontWeight: FontWeight.w500,
            ),
        decoration: InputDecoration(
          counterText: '',
          prefixIcon: Icon(
            Icons.currency_rupee_rounded,
            color: Theme.of(context).iconTheme.color,
            size: 25.sp,
          ),
          hintText: '0',
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 45.sp,
                fontWeight: FontWeight.w500,
              ),
        ),
        readOnly: readOnly,
        keyboardType: TextInputType.number,
        maxLength: 6,
      ),
    );
  }
}
