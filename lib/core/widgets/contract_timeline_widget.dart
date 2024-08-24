import 'package:flutter/material.dart';
import 'package:take_my_tym/core/theme/color/app_colors.dart';
import 'package:take_my_tym/core/widgets/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineTileWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String text;
  final Color color;
  final IconData icon;
  const TimeLineTileWidget({
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.text,
    this.color = const Color.fromRGBO(76, 175, 80, 1),
    this.icon = Icons.done_rounded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: isPast ? color : const Color.fromARGB(255, 192, 192, 192),
      ),
      indicatorStyle: IndicatorStyle(
        width: 25,
        color: isPast ? color : const Color.fromARGB(255, 192, 192, 192),
        iconStyle: IconStyle(
          iconData: icon,
          color:
              isPast ? AppDarkColor.instance.primaryText : Colors.transparent,
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
