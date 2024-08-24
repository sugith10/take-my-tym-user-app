import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/route/route_name/app_route_name.dart';
import '../../../../core/widgets/circle_profile_picture_widget.dart';
import '../bloc/individual_message_bloc/individual_message_bloc.dart';
import '../model/individual_chat_page_arguments.dart';
import '../util/timestamp_time_util.dart';
import 'chat_list_shimmer_widget.dart';

class ChatTileWidget extends StatefulWidget {
  final String currentUserId;
  final String recipientUserId;

  const ChatTileWidget({
    super.key,
    required this.currentUserId,
    required this.recipientUserId,
  });

  @override
  State<ChatTileWidget> createState() => _ChatTileWidgetState();
}

class _ChatTileWidgetState extends State<ChatTileWidget> {
  late final IndividualMessageBloc _individualMessageBloc;

  @override
  void initState() {
    super.initState();
    _individualMessageBloc = IndividualMessageBloc();
    _individualMessageBloc.add(
      GetMessagesEvent(
        currentUserId: widget.currentUserId,
        recipientUserId: widget.recipientUserId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _individualMessageBloc,
      builder: (context, state) {
        if (state is IndividualChatsLoadedState) {
          String receiverName = '';
          return StreamBuilder<QuerySnapshot>(
            stream: state.messages,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const ChatShimmerWidget();
              }
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isNotEmpty) {
                  final messageData = snapshot.data!.docs.last;
                  final message = messageData['message'] ?? 'New message';
                  final time = messageData['timestamp'] ?? Timestamp.now();
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.message,
                          arguments: IndividualChatPageArguments(
                            currentUid: widget.currentUserId,
                            receiverUid: widget.recipientUserId,
                            receiverName: receiverName,
                            individualMessageBloc: _individualMessageBloc,
                          ));
                    },
                    leading: const CircleProfilePicWidget(
                      height: 50,
                      width: 50,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    title: Row(
                      children: [
                        StreamBuilder<DocumentSnapshot>(
                          stream: state.userInfo,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final map = snapshot.data!;
                              receiverName = map['userName'] ?? '....';
                            }
                            return Text(
                              receiverName,
                              style: Theme.of(context).textTheme.titleMedium,
                            );
                          },
                        ),
                        const Spacer(),
                        Text(
                          MessageTimeUtil.timestampToTime(time),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 10.5.sp),
                        )
                      ],
                    ),
                  );
                }
              }
              return const SizedBox.shrink();
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
