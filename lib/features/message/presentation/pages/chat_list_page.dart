import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../bloc/chat_list_bloc/chat_list_bloc.dart';
import '../model/chat_list_item_model.dart';
import '../widgets/chat_list_shimmer_widget.dart';
import '../widgets/chat_tile_widget.dart';
import '../widgets/no_message_widget.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Inbox"),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        width: double.infinity,
        child: BlocBuilder<ChatListBloc, ChatListState>(
          builder: (context, state) {
            if (state is ChatListLoadingState) {
              return const ChatListShimmerWidget();
            }
            if (state is ChatListLoadedState) {
              return StreamBuilder<DocumentSnapshot>(
                stream: state.chatList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.data() == null) {
                      return const NoMessageWidget();
                    }
                    final documentData =
                        snapshot.data!.data() as Map<String, dynamic>;
                    final chatListItems = documentData.entries
                        .map(
                          (i) => ChatListModel(
                            chatId: i.key,
                            recipientUserId: i.value,
                          ),
                        )
                        .toList();
                    if (chatListItems.isEmpty) {
                      return const NoMessageWidget();
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: chatListItems.length,
                      itemBuilder: ((context, index) {
                        final chatListItem = chatListItems[index];
                        final recipientUserId = chatListItem.recipientUserId;
                        return ChatTileWidget(
                          currentUserId: state.userId,
                          recipientUserId: recipientUserId,
                        );
                      }),
                    );
                  }
                  return const ChatListShimmerWidget();
                },
              );
            }
            return const NoMessageWidget(message: "Something went wrong");
          },
        ),
      ),
    );
  }
}
