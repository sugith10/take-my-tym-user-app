import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/sign_in_page.dart';
import 'sign_back_button.dart';

class SubPageInfoWidget extends StatelessWidget {
  final String title;
  final String content;
  const SubPageInfoWidget({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 25),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 70.h),
      ],
    );
  }
}
