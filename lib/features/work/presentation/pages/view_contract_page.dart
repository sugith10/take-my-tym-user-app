import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/left_to_right.dart';
import 'package:take_my_tym/core/widgets/auth_padding.dart';
import 'package:take_my_tym/core/widgets/common_app_bar.dart';
import 'package:take_my_tym/features/work/presentation/widgets/contract_timeline_widget.dart';
import 'package:take_my_tym/features/work/presentation/widgets/offer_subtitle_widget.dart';

class ViewContractPage extends StatelessWidget {
  static route() => leftToRight(const ViewContractPage());
  const ViewContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(),
      body: AuthPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            const OfferSubtitleWidget(title: 'Payment Status'),
            SizedBox(height: 10.h),
            const TimeLineTileWidget(
              isFirst: true,
              isLast: false,
              isPast: true,
              text: "Payment Added",
            ),
            const TimeLineTileWidget(
              isFirst: false,
              isLast: false,
              isPast: true,
              text: "Payment Added",
            ),
            const TimeLineTileWidget(
              isFirst: false,
              isLast: true,
              isPast: false,
              text: "Payment Added",
            ),
          ],
        ),
      ),
    );
  }
}
