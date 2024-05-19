
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../navigation_menu/presentation/widgets/widgets/drawer_button.dart';
import '../../bloc/sign_out_bloc/sign_out_bloc.dart';
import '../../pages/welcome_page.dart';
import 'log_out_dialog.dart';


class LogOutDrawerButton extends StatelessWidget {
  const LogOutDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutBloc, SignOutState>(
      listener: (context, state) {
        if (state is SignOutFailState) {
          AppSnackBar.failSnackBar(
            context: context,
            error: state.error,
          );
        }
        if (state is SignOutSuccessState) {
          context.read<AppUserBloc>().add(UpdateUserSignOutEvent());
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const WelcomePage()),
              (route) => false);
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
