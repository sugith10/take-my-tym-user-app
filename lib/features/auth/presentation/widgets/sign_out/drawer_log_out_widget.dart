import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../../core/widgets/app_snackbar/app_snack_bar.dart';
import '../../../../navigation_menu/presentation/widgets/widgets/drawer_button.dart';
import '../../bloc/sign_out_bloc/sign_out_bloc.dart';
import '../../pages/welcome_page.dart';
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
    super.dispose();
    _signOutBloc.close();
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
          context.read<AppUserBloc>().add(UpdateUserSignOutEvent());
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const WelcomePage()),
            (route) => false,
          );
        }
      },
      child: DrawerCustomButton(
        title: 'Log Out',
        callback: () {
          LogOutWidget().showLogOutDialog(
            context: context,
            signOutBloc: _signOutBloc,
          );
        },
        icon: IconlyLight.logout,
      ),
    );
  }
}
