import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/color/app_colors.dart';
import '../../../../core/util/text_manipulator/taxt_manipulator.dart';

class ChatDateCard extends StatelessWidget {
  const ChatDateCard({
    super.key,
    required this.date,
  });

  final Timestamp date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Card(
          color: AppDarkColor.instance.bottomBar,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Text(
              TextManipulator.timestampToDate(date),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}