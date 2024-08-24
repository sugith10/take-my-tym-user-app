import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String action;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget? actionWidget;
  const DialogButton({
    super.key,
    required this.action,
    required this.backgroundColor,
    required this.callback,
    required this.foregroundColor,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              callback();
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(backgroundColor),
              foregroundColor: WidgetStatePropertyAll(foregroundColor),
            ),
            child: actionWidget ?? Text(action),
          ),
        ),
      ],
    );
  }
}
