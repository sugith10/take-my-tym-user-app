import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/user_bloc/user_bloc.dart';
import 'chat_date_card.dart';

class ChatWidget extends StatelessWidget {
  final String message;
  final String senderId;
  final String time;
  final Timestamp date;
  final bool isFirstMessageOfDay; // Added boolean flag
  const ChatWidget({
    required this.isFirstMessageOfDay,
    required this.message,
    required this.senderId,
    required this.time,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final uid = context.read<UserBloc>().userModel!.uid;
    final width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width - width / 4,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Wrap(
          alignment: uid == senderId ? WrapAlignment.end : WrapAlignment.start,
          children: [
            if (isFirstMessageOfDay) // Show date if it's the first message of the day
              ChatDateCard(date: date),
            Container(
              decoration: uid == senderId
                  ? const BoxDecoration(
                      color: Color(0xFF005D4B),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    )
                  : const BoxDecoration(
                      color: Color(0xFF1F2C34),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Column(
                  crossAxisAlignment: uid == senderId
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: const Color.fromARGB(255, 213, 213, 213),
                            fontSize: 10.sp,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
