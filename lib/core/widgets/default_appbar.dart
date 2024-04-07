import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/settings_button.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final VoidCallback settings;
  const DefaultAppBar(
      {this.title, this.leading, required this.settings, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      title: title,
      actions: [
        SettingsButton(
          callback: () {
            settings();
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
