import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class CloseIconButton extends StatelessWidget {
  final Function onPressed;
  final  Widget child;
  const CloseIconButton({
    required this.child,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Theme.of(context).scaffoldBackgroundColor),
        side: MaterialStatePropertyAll(
          BorderSide(color: AppDarkColor.instance.primaryBorder),
        ),
      ),
      onPressed: () {
       onPressed();
      },
      icon: child,
    );
  }
}