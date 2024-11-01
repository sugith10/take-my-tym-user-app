import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/theme/color/app_colors.dart';

import 'dialog_button.dart';

class AppDialog {
  static show({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String action,
    required VoidCallback actionCall,
    Color? actionColor,
    Widget? actionWidget,
    bool actionPop = false,
    String canecel = "Cancel",
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 25.h),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 10.h),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppDarkColor.instance.primaryTextBlur,
                      ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                DialogButton(
                  action: canecel,
                  backgroundColor: AppDarkColor.instance.buttonBackground,
                  foregroundColor: AppDarkColor.instance.buttonForground,
                  callback: () => Navigator.pop(context),
                ),
                SizedBox(height: 12.h),
                DialogButton(
                  action: action,
                  backgroundColor: actionColor ?? AppDarkColor.instance.danger,
                  foregroundColor: AppDarkColor.instance.buttonBackground,
                  callback: () {
                    if (actionPop) {
                      Navigator.pop(context);
                    }
                    actionCall();
                  },
                  actionWidget: actionWidget,
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

