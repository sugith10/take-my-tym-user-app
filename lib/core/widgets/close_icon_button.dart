import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class CloseIconButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final Color? borderColor;
  const CloseIconButton({
    required this.child,
    required this.onPressed,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      style: ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(Theme.of(context).scaffoldBackgroundColor),
        side: WidgetStatePropertyAll(
          BorderSide(
            color: borderColor != null
                ? borderColor!
                : AppDarkColor.instance.primaryBorder,
          ),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      icon: child,
    );
  }
}
