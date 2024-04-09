import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final VoidCallback callback;
  final IconData actionIcon;
  const DefaultAppBar(
      {this.title,
      this.leading,
      required this.actionIcon,
      required this.callback,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      title: title,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(actionIcon),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
