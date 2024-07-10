import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/app_error_msg.dart';
import '../../const/app_radius.dart';
import '../../assets/app_svg.dart';
import '../../theme/color/app_colors.dart';

part 'snack_bar_content_widget.dart';

/// A utility class for displaying app default custom snack bars in the application.
final class AppSnackBar {
  AppSnackBar._();

  /// The snack bar will appear at the bottom of the screen and automatically
  /// disappear after 3 seconds. The appearance is customized with a red
  /// background and an appropriate icon to indicate an error.
  static failSnackBar({
    required BuildContext context,
    required AppAlert alert,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _SnackBarContentWidget(
          message: alert.alert,
          description: alert.details,
          backgroundColor: const Color(0xFFC72c41),
          assetColor: const Color(0xFF801336),
          icon: AppSvg.snackBarFail,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// The snack bar will appear at the bottom of the screen and automatically
  /// disappear after 3 seconds. The appearance is customized with a green
  /// background and an appropriate icon to indicate success.
  static successSnackBar({
    required BuildContext context,
    required AppAlert alert,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _SnackBarContentWidget(
          message: alert.alert,
          description: alert.details,
          backgroundColor: const Color(0xff2D6A4F),
          assetColor: const Color.fromARGB(255, 31, 63, 49),
          icon: AppSvg.snackBarSuccess,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
