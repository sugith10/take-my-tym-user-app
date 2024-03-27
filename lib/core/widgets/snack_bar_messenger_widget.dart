import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/snack_bar_content_widget.dart';

final class SnackBarMessenger {
  showSnackBar({required BuildContext context, required String msg}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SnackBarContentWidget(
          message:
             msg,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
