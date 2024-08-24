import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/text_manipulator/taxt_manipulator.dart';
import '../bloc/individual_message_bloc/individual_message_bloc.dart';
import '../util/timestamp_time_util.dart';
import '../widgets/chat_text_field.dart';
import '../widgets/chat_widget.dart';
import '../widgets/individual_chat_app_bar.dart';

class IndividualChatPage extends StatefulWidget {
  final String receiverUid;
  final String currentUid;
  final String receiverName;

  final IndividualMessageBloc individualMessageBloc;

  const IndividualChatPage({
    required this.currentUid,
    required this.receiverUid,
    required this.receiverName,
    required this.individualMessageBloc,
    super.key,
  });

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.individualMessageBloc.add(
      GetMessagesEvent(
        currentUserId: widget.currentUid,
        recipientUserId: widget.receiverUid,
      ),
    );

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Future.delayed(
            const Duration(milliseconds: 300), () => _scrollToBottom());
      }
    });
  }

  // void _scrollToBottomIntial() {
  //   if (_scrollController.hasClients) {
  //     _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  //   }
  // }

  void _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IndividualChatAppBar(receiverName: widget.receiverName),
      body: Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
        child: BlocBuilder(
          bloc: widget.individualMessageBloc,
          builder: (context, state) {
            if (state is IndividualChatsLoadedState) {
              return StreamBuilder<QuerySnapshot>(
                stream: state.messages,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToBottom();
                    });
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final messageData = snapshot.data!.docs[index];
                              final message = messageData['message'] ?? 'error';
                              final senderId =
                                  messageData['senderUid'] ?? 'error';
                              final Timestamp time =
                                  messageData['timestamp'] ?? Timestamp.now();

                              // Check if the current message is the first message of a new day
                              bool isFirstMessageOfDay = true;
                              if (index > 0) {
                                final previousTimestamp =
                                    snapshot.data!.docs[index - 1]['timestamp'];
                                final previousDate = previousTimestamp.toDate();
                                isFirstMessageOfDay = MessageTimeUtil.isSameDay(
                                    time.toDate(), previousDate);
                              }
                              return ChatWidget(
                                isFirstMessageOfDay: isFirstMessageOfDay,
                                date: time,
                                message: message,
                                senderId: senderId,
                                time: TextManipulator.timestampToTime(time),
                              );
                            },
                          ),
                        ),
                        ChatTextField(
                          focusNode: _focusNode,
                          individualMessageBloc: widget.individualMessageBloc,
                          currentUid: widget.currentUid,
                          receiverUid: widget.receiverUid,
                          receiverName: widget.receiverName,
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
