import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class CloseIconButton extends StatelessWidget {
  final VoidCallback callback;
  final  Widget child;
  const CloseIconButton({
    required this.child,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Theme.of(context).scaffoldBackgroundColor),
        side: MaterialStatePropertyAll(
          BorderSide(color: MyAppDarkColor.instance.primaryBorder),
        ),
      ),
      onPressed: () {
       callback();
      },
      icon: child,
    );
  }
}