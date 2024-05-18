import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../bloc/sign_out_bloc/sign_out_bloc.dart';

class UserLogOut {
  void showLogOutDialog({
    required BuildContext context,
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
                  'Log out confirmation',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Are you sure you want log out?',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppDarkColor.instance.primaryTextBlur,
                      ),
                ),
                const Spacer(),
                _MessageButton(
                  action: const Text('CANCEL'),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  callback: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 12.h),
                _MessageButton(
                  action: const Text("LOG OUT"),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  callback: () {
                    context.read<SignOutBloc>().add(UserSignOutEvent());
                  },
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
  final Widget action;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color foregroundColor;
  const _MessageButton({
    required this.action,
    required this.backgroundColor,
    required this.callback,
    required this.foregroundColor,
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
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(backgroundColor),
                foregroundColor: WidgetStatePropertyAll(foregroundColor),
              ),
              child: action),
        ),
      ],
    );
  }
}
