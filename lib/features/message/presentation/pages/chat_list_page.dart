import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/widgets/default_silver_appbar.dart';
import 'package:take_my_tym/features/message/presentation/bloc/chat_list_bloc/chat_list_bloc.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_list_shimmer_widget.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_tile_widget.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  late final String _currentUserId;

  @override
  void initState() {
    super.initState();

    _currentUserId = context.read<AppUserBloc>().appUserModel!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          DefaultSilverAppBar(
            title: 'Inbox',
            settings: () {},
          ),
          SliverToBoxAdapter(child: BlocBuilder<ChatListBloc, ChatListState>(
            builder: (context, state) {
              if (state is ChatListLoadingState) {
                return  const ChatListShimmerWidget();
              }
              if (state is ChatListLoadedState) {
                return StreamBuilder<DocumentSnapshot>(
                  stream: state.chatList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final documentData =
                          snapshot.data!.data() as Map<String, dynamic>;
                      final chatListItems = documentData.entries
                          .map(
                            (i) => ChatListItem(chatId: i.key, recipientUserId: i.value),
                          )
                          .toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: chatListItems.length,
                        itemBuilder: ((context, index) {
                          final chatListItem = chatListItems[index];
                          final chatId = chatListItem.chatId;
                          final recipientUserId = chatListItem.recipientUserId;
                          return ChatTileWidget(
                            currentUserId: _currentUserId,
                            recipientUserId: recipientUserId,
                          );
                        }),
                      );

                     
                    }
                    return const SizedBox.shrink();
                  },
                );
              }
              return const SizedBox.shrink();
            },
          )),
          // SliverList.builder(
          //   itemCount: 20,
          //   itemBuilder: (BuildContext context, int index) {
          //     return const ChatTileWidget(
          //       personName: 'Sugith',
          //       lastMessage: 'hello world!',
          //       lastMsgTime: '12:24 pm',
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}



class ChatListItem {
  final String chatId;
  final String recipientUserId;

  const ChatListItem({required this.chatId, required this.recipientUserId});
}
