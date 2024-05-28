import 'package:flutter/material.dart';

import '../../../../core/const/app_padding.dart';


class ChatDivider extends StatelessWidget {
  const ChatDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: AppPading.homePadding,
        right: AppPading.homePadding,
      ),
      child: Divider(),
    );
  }
}