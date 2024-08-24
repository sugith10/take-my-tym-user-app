import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:take_my_tym/core/theme/color/app_colors.dart';

import '../../../../core/widgets/app_dialog.dart';

final class PostDialog {
  PostDialog._();
  static update(
      {required BuildContext context, required VoidCallback callBack}) {
    AppDialog.show(
      context: context,
      title: 'Update confirmation',
      subtitle: 'Are you sure you want delete this post?',
      action: 'Update',
      actionColor: AppDarkColor.instance.success,
      actionCall: () {
        callBack();
      },
    );
  }

  static delete(
      {required BuildContext context, required VoidCallback callBack}) {
    AppDialog.show(
      context: context,
      title: 'Delete confirmation',
      subtitle: 'Are you sure you want delete this post?',
      action: 'Delete',
      actionCall: () {
        callBack();
      },
    );
  }
}
