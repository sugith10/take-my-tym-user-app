import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/route/route_name/app_route_name.dart';

import '../../../../../core/bloc/user_bloc/user_bloc.dart';
import '../../../../../core/widgets/app_snackbar/app_snack_bar.dart';
import '../../../../navigation_menu/presentation/widget/drawer_button.dart';
import '../../bloc/sign_out_bloc/sign_out_bloc.dart';
import 'log_out_dialog.dart';

class LogOutDrawerButton extends StatefulWidget {
  const LogOutDrawerButton({super.key});

  @override
  State<LogOutDrawerButton> createState() => _LogOutDrawerButtonState();
}

class _LogOutDrawerButtonState extends State<LogOutDrawerButton> {
  final SignOutBloc _signOutBloc = SignOutBloc();

  @override
  void dispose() {
    _signOutBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _signOutBloc,
      listener: (context, state) {
        if (state is SignOutFailState) {
          AppSnackBar.failSnackBar(
            context: context,
            alert: state.error,
          );
        }
        if (state is SignOutSuccessState) {
          log('hello');
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.welcome, (_) => false);
          context.read<UserBloc>().add(UserExitEvent());
        }
      },
      child: DrawerCustomButton(
        title: 'Log Out',
        callback: () {
          LogOutWidget().showLogOutDialog(
            context: context,
          );
        },
        icon: IconlyLight.logout,
      ),
    );
  }
}
