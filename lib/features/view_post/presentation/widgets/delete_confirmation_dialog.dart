import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/widgets/app_dialog.dart';

final class DeleteConfirmationDialog {
  show({required BuildContext context, required VoidCallback callBack}) {
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
