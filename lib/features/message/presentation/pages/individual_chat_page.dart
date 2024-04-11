import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/bloc/app_bloc.dart';
import 'package:take_my_tym/features/message/presentation/bloc/individual_message_bloc/individual_message_bloc.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_text_field.dart';

class IndividualChatPage extends StatelessWidget {
  final String receiverUid;
  final String currentUid;
  final String receiverName;
  final String senderName;

  const IndividualChatPage({
    required this.currentUid,
    required this.senderName,
    required this.receiverUid,
    required this.receiverName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverName),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
        child: BlocBuilder(
          bloc: IndividualMessageBloc(),
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
        currentUid: currentUid,
        receiverUid: receiverUid,
        receiverName: receiverName,
        senderName: senderName,
      ),
    );
  }
}

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
        alignment: context.read<AppBloc>().appUserModel!.uid == senderId
            ? WrapAlignment.end
            : WrapAlignment.start,
        children: [
          Container(
              decoration: context.read<AppBloc>().appUserModel!.uid == senderId
                  ? const BoxDecoration(
                      color: Color.fromARGB(255, 30, 110, 186),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    )
                  : BoxDecoration(
                      color: Colors.green[300],
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
