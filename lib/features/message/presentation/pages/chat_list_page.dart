import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/widgets/default_silver_appbar.dart';
import 'package:take_my_tym/features/message/presentation/bloc/chat_list_bloc/chat_list_bloc.dart';
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
          SliverToBoxAdapter(child: BlocBuilder<ChatListBloc, ChatListState>(
            builder: (context, state) {
              if (state is ChatListLoadingState) {
                return const CircularProgressIndicator();
              }
              if (state is ChatListLoadedState) {
                return StreamBuilder<DocumentSnapshot>(
                    stream: state.chatList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var documentData = snapshot.data!.data();
                        log("snapshot: ${snapshot.data!.data().toString()}");
                        //  if(documentData != null &&  )
                        //         return ListView.builder(
                        //           itemCount: snapshot.l,
                        // itemBuilder: (BuildContext context, int index) {

                        //   return const ChatTileWidget(
                        //     personName: 'Sugith',
                        //     lastMessage: 'hello world!',
                        //     lastMsgTime: '12:24 pm',
                        //   );
                        // },
                        //           )
                      }
                      return SizedBox();
                    });
              }
              return SizedBox();
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
