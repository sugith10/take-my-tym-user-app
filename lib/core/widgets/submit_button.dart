import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const SubmitButton({
    required this.callback,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MyAppPadding.homePadding),
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: Text(text,),
      ),
    );
  }
}
