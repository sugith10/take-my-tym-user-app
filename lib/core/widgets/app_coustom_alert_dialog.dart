import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCoustomAlertDialog {
  showLoadingIndicator({
    required BuildContext context,
    required String title,
    required String actionOne,
    required Color actionOneColor,
    required Color actionTwoColor,
    required VoidCallback actionOneCallback,
    required VoidCallback actionTwoCallback,
    String? content,
    String actionTwo = 'CANCEL',
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 25.h),
                const Spacer(),
                _MessageButton(
                  action: actionOne,
                  backgroundColor: actionOneColor,
                  callback: actionOneCallback,
                ),
                SizedBox(height: 12.h),
                _MessageButton(
                  action: actionTwo,
                  backgroundColor: actionTwoColor,
                  callback: actionOneCallback,
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

class _MessageButton extends StatelessWidget {
  final String action;
  final VoidCallback callback;
  final Color backgroundColor;
  const _MessageButton({
    required this.action,
    required this.backgroundColor,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              callback();
            },
            child: Text(action.toUpperCase()),
          ),
        ),
      ],
    );
  }
}
