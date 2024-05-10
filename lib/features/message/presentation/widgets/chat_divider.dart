import 'package:flutter/material.dart';

import '../../../../core/utils/app_padding.dart';


class ChatDivider extends StatelessWidget {
  const ChatDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: MyAppPadding.homePadding,
        right: MyAppPadding.homePadding,
      ),
      child: Divider(),
    );
  }
}