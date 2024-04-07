import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/app_bar_title.dart';
import 'package:take_my_tym/core/widgets/settings_button.dart';

class DefaultSilverAppBar extends StatelessWidget {
  final String title;
  final VoidCallback settings;
  const DefaultSilverAppBar({
    required this.title,
    required this.settings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      title: AppBarTitle(title: title),
      actions: [
        SettingsButton(
          callback: () {
            settings();
          },
        ),
      ],
    );
  }
}
