import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class ChatWidget extends StatelessWidget {
  final String message;
  final String senderId;
  const ChatWidget({
    required this.message,
    required this.senderId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Wrap(
        alignment: context.read<AppUserBloc>().userModel!.uid == senderId
            ? WrapAlignment.end
            : WrapAlignment.start,
        children: [
          Container(
              decoration: context.read<AppUserBloc>().userModel!.uid == senderId
                  ? BoxDecoration(
                      color: AppDarkColor.instance.userChatColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    )
                  : BoxDecoration(
                      color: AppDarkColor.instance.recipientChatColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              )),
        ],
      ),
    );
  }
}
