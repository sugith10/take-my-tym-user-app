import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';

class ChatTileWidget extends StatelessWidget {
  final String personName;
  final String lastMessage;
  final String lastMsgTime;
  final String personPhoto;

  const ChatTileWidget({
    super.key,
    required this.personName,
    required this.lastMessage,
    required this.lastMsgTime,
    this.personPhoto = MyAppImages.profileIcon
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleProfilePicWidget(
        height: 50,
        width: 50,
        image: personPhoto,
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