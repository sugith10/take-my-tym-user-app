import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/features/message/presentation/bloc/individual_message_bloc/individual_message_bloc.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_text_field.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_widget.dart';

class IndividualChatPage extends StatefulWidget {
  final String receiverUid;
  final String currentUid;
  final String receiverName;
  final String senderName;
  final IndividualMessageBloc? individualMessageBloc;

  const IndividualChatPage({
    required this.currentUid,
    required this.senderName,
    required this.receiverUid,
    required this.receiverName,
    this.individualMessageBloc,
    super.key,
  });

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  late final IndividualMessageBloc _individualMessageBloc;

  @override
  void initState() {
    super.initState();
    if (widget.individualMessageBloc != null) {
      _individualMessageBloc = widget.individualMessageBloc!;
    } else {
      _individualMessageBloc = IndividualMessageBloc();
      _individualMessageBloc.add(GetMessagesEvent(
        currentUserId: widget.currentUid,
        recipientUserId: widget.receiverUid,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverName),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
        child: BlocBuilder(
          bloc: _individualMessageBloc,
          builder: (context, state) {
            log(state.toString());
            if (state is IndividualChatsLoadedState) {
              return StreamBuilder<QuerySnapshot>(
                stream: state.messages,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final messageData = snapshot.data!.docs[index];
                        final message = messageData['message'] ?? 'error';
                        final senderId = messageData['senderUid'] ?? 'error';
                        return ChatWidget(
                          message: message,
                          senderId: senderId,
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
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
      bottomNavigationBar: ChatTextField(
        individualMessageBloc: _individualMessageBloc,
        currentUid: widget.currentUid,
        receiverUid: widget.receiverUid,
        receiverName: widget.receiverName,
        senderName: widget.senderName,
      ),
    );
  }
}
