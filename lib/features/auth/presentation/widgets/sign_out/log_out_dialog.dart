import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_dialog.dart';
import '../../bloc/sign_out_bloc/sign_out_bloc.dart';

class LogOutWidget {
  void showLogOutDialog({
    required BuildContext context,
    required SignOutBloc signOutBloc,
  }) {
    AppDialog.show(
      context: context,
      title: 'Log Out Confirmation',
      subtitle: 'Are you sure you want to log out?',
      action: "LOG OUT",
      canecel: "CANCEL",
      actionCall: () => signOutBloc.add(UserSignOutEvent()),
      actionPop: true,
    );
  }
}
