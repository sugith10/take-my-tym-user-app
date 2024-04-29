import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineTileWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String text;
  const TimeLineTileWidget({
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: isPast
            ? MyAppDarkColor.instance.success
            : const Color.fromARGB(255, 192, 192, 192),
      ),
      indicatorStyle: IndicatorStyle(
        width: 25,
        color: isPast
            ? MyAppDarkColor.instance.success
            : const Color.fromARGB(255, 192, 192, 192),
        iconStyle: IconStyle(
          iconData: Icons.done_rounded,
          color: isPast
              ? MyAppDarkColor.instance.primaryText
              : Colors.transparent,
          fontSize: 20,
        ),
      ),
      endChild: EventCard(
        isPast: isPast,
        title: text,
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final bool isPast;
  final String title;
  const EventCard({
    required this.isPast,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: MyAppDarkColor.instance.secondaryBackground,
          borderRadius: BorderRadius.circular(MyAppRadius.borderRadius)),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: isPast
                  ? MyAppDarkColor.instance.primaryTextSoft
                  : MyAppDarkColor.instance.secondaryText,
            ),
      ),
    );
  }
}
