import 'package:flutter/material.dart';

class LoadingDialog {
  LoadingDialog._();

  /// Show a dialog with a circular progress indicator
  static show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }

  // This function is used to hide a route
  static void hide(BuildContext context, [int count = 1]) {
    int currentCount = 0;
    Navigator.popUntil(
      context,
      (route) {
        // This line checks if the count is equal to currentCount
        return currentCount++ == count;
      },
    );
  }
}
