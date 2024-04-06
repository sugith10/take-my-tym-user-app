import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/app_bar_title.dart';
import 'package:take_my_tym/core/widgets/settings_button.dart';
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
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            title: const AppBarTitle(title: 'Inbox'),
            actions: [
              SettingsButton(
                callback: () {},
              )
            ],
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
