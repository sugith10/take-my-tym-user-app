import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/const/app_icons.dart';
import '../../../../core/widgets/popup_menu_item_child_widget.dart';

class ViewPostAppBar extends StatelessWidget {
  final VoidCallback delete;
  final VoidCallback update;
  final bool showMoreButton;
  const ViewPostAppBar({
    required this.showMoreButton,
    required this.update,
    required this.delete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(AppIcon.back),
      ),
      actions: [
        showMoreButton
            ? PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: ("Update"),
                    child: PopupMenuItemChildWidget(
                      value: 'Update',
                      icon: IconlyLight.edit,
                    ),
                  ),
                  const PopupMenuItem(
                    value: ("Delete"),
                    child: PopupMenuItemChildWidget(
                        value: 'Delete', icon: IconlyLight.delete),
                  )
                ],
                onSelected: (value) {
                  if (value == "Delete") {
                    delete();
                  } else if (value == "Update") {
                    update();
                  }
                },
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
