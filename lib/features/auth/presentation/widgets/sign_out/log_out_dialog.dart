import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/color/app_colors.dart';
import '../../../../../core/widgets/dialog_button.dart';
import '../../bloc/sign_out_bloc/sign_out_bloc.dart';

class LogOutWidget {
  void showLogOutDialog({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) => const LogOutDialog(),
    );
  }
}

class LogOutDialog extends StatefulWidget {
  const LogOutDialog({super.key});

  @override
  State<LogOutDialog> createState() => _LogOutDialogState();
}

class _LogOutDialogState extends State<LogOutDialog> {
  final signOutBloc = SignOutBloc();

  @override
  void dispose() {
    signOutBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            FittedBox(
              child: Text(
                'Log Out Confirmation',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SizedBox(height: 10.h),
            FittedBox(
              child: Text(
                'Are you sure you want to log out?',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppDarkColor.instance.primaryTextBlur,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            DialogButton(
              action: "Cancel",
              backgroundColor: AppDarkColor.instance.buttonBackground,
              foregroundColor: AppDarkColor.instance.buttonForground,
              callback: () => Navigator.pop(context),
            ),
            SizedBox(height: 12.h),
            DialogButton(
              action: "LOG OUT",
              backgroundColor: AppDarkColor.instance.danger,
              foregroundColor: AppDarkColor.instance.buttonBackground,
              callback: () {},
              actionWidget: BlocBuilder(
                bloc: signOutBloc,
                builder: (context, state) {
                  if (state is SignOutLoadingState) {
                    return const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const Text("LOG OUT");
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
