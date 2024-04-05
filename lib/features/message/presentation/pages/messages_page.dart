import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/app_bar_title.dart';
import 'package:take_my_tym/core/widgets/settings_button.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_divider.dart';
import 'package:take_my_tym/features/message/presentation/widgets/chat_tile_widget.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    log("message");
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: const AppBarTitle(title: 'Inbox'),
            actions: [
              SettingsButton(
                callback: () {},
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              addAutomaticKeepAlives: true,
              [
               const ChatTileWidget(
                  personName: 'Sugith',
                  lastMessage: 'hello world!',
                  lastMsgTime: '12:24 pm',
                ),
                const ChatDivider(),
                 const ChatTileWidget(
                  personName: 'Sugith',
                  lastMessage: 'hello world!',
                  lastMsgTime: '12:24 pm',
                ),
                const ChatDivider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}