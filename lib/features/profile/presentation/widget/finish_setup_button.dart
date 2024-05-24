import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/theme/color/app_colors.dart';

class FinishSetupButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const FinishSetupButton({
    required this.callback,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 30, 30, 30),
                Color.fromARGB(255, 25, 24, 24),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppDarkColor.instance.boxShadow.withOpacity(0.2),
                spreadRadius: .5,
                blurRadius: .5,
                offset: const Offset(.2, .2),
              ),
            ]),
        height: 50.h,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: .5,
                color: AppDarkColor.instance.primaryText),
          ),
        ),
      ),
    );
  }
}
