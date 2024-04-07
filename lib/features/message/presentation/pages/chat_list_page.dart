import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/default_silver_appbar.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_tile_widget.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
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
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return const ChatTileWidget(
                personName: 'Sugith',
                lastMessage: 'hello world!',
                lastMsgTime: '12:24 pm',
              );
            },
          ),
        ],
      ),
    );
  }
}
