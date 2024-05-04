import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/widgets/app_snack_bar.dart';
import 'package:take_my_tym/features/auth/presentation/bloc/sign_out_bloc/sign_out_bloc.dart';
import 'package:take_my_tym/features/auth/presentation/pages/welcome_page.dart';
import 'package:take_my_tym/features/auth/presentation/widgets/user_sign_out_dialog.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/widgets/drawer/widgets/drawer_button.dart';

class LogOutDrawerButton extends StatelessWidget {
  const LogOutDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutBloc, SignOutState>(
      listener: (context, state) {
        if (state is UserSignOutFailState) {
          AppSnackBar.failSnackBar(
            context: context,
            error: state.error,
          );
        }
        if (state is UserSignOutSuccessState) {
          context.read<AppUserBloc>().add(UpdateUserSignOutEvent());
          log(context.read<AppUserBloc>().appUserModel.toString());
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const WelcomePage()),
              (route) => false);
        }
      },
      child: DrawerCustomButton(
        title: 'Log Out',
        function: () {
          UserLogOut().showLogOutDialog(
            context: context,
          );
        },
        icon: IconlyLight.logout,
      ),
    );
  }
}
