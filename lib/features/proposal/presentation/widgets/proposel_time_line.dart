import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../core/assets/app_svg.dart';
import '../../../../core/theme/color/app_colors.dart';
import '../../../../core/widgets/event_card.dart';
import '../../../../core/widgets/home_padding.dart';

class ProposelTimeLine extends StatelessWidget {
  const ProposelTimeLine({
    super.key,
  });
  final String stepOne =
      'The creator reviews your profile and proposal, then accepts or rejects it. 🔎';
  final String stepTwo =
      'If accepted, the contract begins, and payment is debited from the creator. 💸';
  final String stepThree =
      'Although the payment is debited from the creator, it remains locked. 🔐';
  final String stepFour =
      'Complete the work, and upon verification by the creator, payment is credited to your wallet. Wooh!! 🎊';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HomePadding(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Text(
              "Here is the short decription\nWhat is going to happen next",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: true,
                    indicatorStyle: _indicator(AppSvg.numberOne),
                    beforeLineStyle: LineStyle(
                      color: AppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    endChild: EventCard(
                      isPast: true,
                      title: stepOne,
                    ),
                  ),
                  TimelineDivider(
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: AppDarkColor.instance.success,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.9,
                    beforeLineStyle: LineStyle(
                      color: AppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    afterLineStyle: LineStyle(
                      color: AppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    indicatorStyle: _indicator(AppSvg.numberTwo),
                    startChild: EventCard(
                      isPast: true,
                      title: stepTwo,
                    ),
                  ),
                  TimelineDivider(
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: AppDarkColor.instance.success,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    beforeLineStyle: LineStyle(
                      color: AppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    indicatorStyle: _indicator(AppSvg.numberThree),
                    endChild: EventCard(
                      isPast: true,
                      title: stepThree,
                    ),
                  ),
                  TimelineDivider(
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: AppDarkColor.instance.success,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.9,
                    isLast: true,
                    beforeLineStyle: LineStyle(
                      color: AppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    indicatorStyle: _indicator(AppSvg.numberFour),
                    startChild: EventCard(
                      isPast: true,
                      title: stepFour,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IndicatorStyle _indicator(String image) {
    return IndicatorStyle(
      width: 20,
      indicator: CircleAvatar(
        backgroundColor: AppDarkColor.instance.success,
        child: SvgPicture.asset(
          image,
          height: 10,
          width: 10,
        ),
      ),
    );
  }
}
