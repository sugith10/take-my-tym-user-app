import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback callback;

  const SettingsButton({
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return IconButton(
    //   onPressed: () {
    //     callback();
    //   },
    //   icon: const Icon(IconlyBold.setting),
    // );
    return const SizedBox.shrink();
  }
}
