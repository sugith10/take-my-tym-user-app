import 'package:flutter/material.dart';

class LoadingDialog {
  show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void hide(BuildContext context) => Navigator.pop(context);
}
