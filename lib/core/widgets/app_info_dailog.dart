import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/close_icon_button.dart';

class AppInfoDialog {
  AppInfoDialog._();
  static void show({required BuildContext context, required Widget widget}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).bottomSheetTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        widget,
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CloseIconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close_rounded),
                ),
              ],
            ),
          );
        });
  }
}
