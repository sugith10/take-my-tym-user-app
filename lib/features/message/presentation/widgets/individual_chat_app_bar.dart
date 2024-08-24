import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/const/app_icons.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../../../core/widgets/popup_menu_item_child_widget.dart';

class IndividualChatAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const IndividualChatAppBar({
    super.key,
    required this.receiverName,
  });

  final String receiverName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(AppIcon.back),
      ),
      title: Text(receiverName),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: ("Block"),
              child: PopupMenuItemChildWidget(
                value: 'Block',
                icon: IconlyLight.shield_fail,
              ),
            ),
            const PopupMenuItem(
              value: ("Report"),
              child: PopupMenuItemChildWidget(
                value: 'Report',
                icon: IconlyLight.danger,
              ),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 'Block':
                AppDialog.show(
                  context: context,
                  title: 'Block User',
                  subtitle: 'Are you sure you want to block this user?',
                  action: 'Block',
                  actionCall: () {},
                );
                break;
              case 'Report':
                break;
            }
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
