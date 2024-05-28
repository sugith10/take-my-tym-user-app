import 'package:flutter/material.dart';

import '../../../../core/theme/color/app_colors.dart';

final class LocationPermissionDenied {
  void dialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
            child: Text(
          'Location Permission Denied',
          style: TextStyle(color: AppDarkColor.instance.danger),
        )),
        content: Text(
          "Please enable the location permission in your application settings to use this feature.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppDarkColor.instance.primaryTextSoft,
              ),
        ),
      ),
    );
  }
}
