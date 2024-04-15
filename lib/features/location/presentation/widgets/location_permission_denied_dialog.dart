import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

final class LocationPermissionDenied {
  void dialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
            child: Text(
          'Location Permission Denied',
          style: TextStyle(color: MyAppDarkColor.instance.danger),
        )),
        content: Text(
          "Please enable the location permission in your application settings to use this feature.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: MyAppDarkColor.instance.primaryTextSoft,
              ),
        ),
      ),
    );
  }
}
