import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';
import 'package:take_my_tym/features/message/presentation/pages/individual_chat_page.dart';

class ChatTileWidget extends StatelessWidget {
  final String personName;
  final String lastMessage;
  final String lastMsgTime;
  final String personPhoto;

  const ChatTileWidget(
      {super.key,
      required this.personName,
      required this.lastMessage,
      required this.lastMsgTime,
      this.personPhoto = MyAppImages.profileIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const IndividualChatPage(
                      currentUid: '',
                      receiverUid: '',
                      receiverName: '',
                      senderName: '',
                    )));
      },
      leading: SizedBox(
        height: 50,
        child: Stack(alignment: Alignment.bottomRight, children: [
          const CircleProfilePicWidget(
            height: 50,
            width: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CircleAvatar(
              radius: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
          )
        ]),
      ),
      title: Text(
        personName,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Text(
        lastMessage,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Text(
        lastMsgTime,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
