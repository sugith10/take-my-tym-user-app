import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class SignBackButton extends StatelessWidget {
  final VoidCallback callback;
  const SignBackButton(
    {
    required this. callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height: 10.h),
        Align(
          alignment: Alignment.bottomLeft,
          child: IconButton(
            onPressed: () {
              callback();
            },
            icon: const Icon(
              IconlyBroken.arrow_left,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}