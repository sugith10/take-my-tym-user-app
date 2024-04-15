import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

class TransactionDialog extends StatelessWidget {
  final String amount;
  final String from;
  final String time;
  final String image;

  const TransactionDialog({
    required this.amount,
    required this.from,
    required this.time,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.grey,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          MyAppRadius.borderRadius,
        ),
      ),
      backgroundColor: MyAppDarkColor.instance.glassEffect,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
          border: Border.all(
            width: 1.5,
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h),
            Text(
              'Amount',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(height: 7.h),
            Text(
              '₹$amount',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 10.h),
            const Divider(),
            SizedBox(height: 10.h),
            const Text('Received From'),
            SizedBox(height: 10.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
              child: Image.asset(
                image,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 7.h),
            Text(
              from,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 10.h),
            const Divider(),
            SizedBox(height: 10.h),
            const Text('Date'),
            SizedBox(height: 7.h),
            Text(
              time,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
