import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/features/auth/presentation/pages/sign_in_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/sign_back_button.dart';

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
        SizedBox(height: 10.h),
      SignBackButton(callback: () {
        Navigator.pushAndRemoveUntil(context, SignInPage.route(), (route) => false);
      },),
        SizedBox(height: 120.h),
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
