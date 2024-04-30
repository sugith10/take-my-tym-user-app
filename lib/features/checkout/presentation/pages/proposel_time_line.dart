import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:take_my_tym/core/utils/app_assets/app_svg.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/widgets/event_card.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ProposelTimeLine extends StatelessWidget {
  const ProposelTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    const String stepOne =
        'The creator reviews your profile and proposal, then accepts or rejects it.';
    const String stepTwo =
        'If accepted, the contract begins, and payment is debited from the creator.';
    const String stepThree =
        'The creator reviews your profile and proposal, then accepts or rejects it.';
    const String stepFour =
        'Complete the work, and upon verification by the creator, payment is credited to your wallet. Wooh!!';
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
                    indicatorStyle: _indicator(MyAppSVG.numberOne),
                    beforeLineStyle: LineStyle(
                      color: MyAppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    endChild: const EventCard(
                      isPast: true,
                      title: stepOne,
                    ),
                  ),
                  TimelineDivider(
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: MyAppDarkColor.instance.success,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.9,
                    beforeLineStyle: LineStyle(
                      color: MyAppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    afterLineStyle: LineStyle(
                      color: MyAppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    indicatorStyle: _indicator(MyAppSVG.numberTwo),
                    startChild: const EventCard(
                      isPast: true,
                      title: stepTwo,
                    ),
                  ),
                  TimelineDivider(
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: MyAppDarkColor.instance.success,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    beforeLineStyle: LineStyle(
                      color: MyAppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    indicatorStyle: _indicator(MyAppSVG.numberThree),
                    endChild: const EventCard(
                      isPast: true,
                      title: stepThree,
                    ),
                  ),
                  TimelineDivider(
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: MyAppDarkColor.instance.success,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.9,
                    isLast: true,
                    beforeLineStyle: LineStyle(
                      color: MyAppDarkColor.instance.success,
                      thickness: 6,
                    ),
                    indicatorStyle: _indicator(MyAppSVG.numberFour),
                    startChild: const EventCard(
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
        backgroundColor: MyAppDarkColor.instance.success,
        child: SvgPicture.asset(
          image,
          height: 10,
          width: 10,
          // color: Colors.white,
        ),
      ),
    );
  }
}
