
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletUpdateTimeWidget extends StatelessWidget {
  final String date;
  final String time;
  const WalletUpdateTimeWidget({
    required this.time,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "Last Updated at: $date | $time IST",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 11.sp),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
