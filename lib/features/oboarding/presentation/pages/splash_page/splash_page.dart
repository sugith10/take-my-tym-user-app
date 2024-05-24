import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../../core/widgets/app_logo.dart';
import '../../../../auth/presentation/pages/welcome_page.dart';
import '../../../../navigation_menu/presentation/pages/home_navigation_menu.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppUserBloc, AppState>(
      listener: (context, state) {
        if (state is UserModelUpdatedState) {
          Navigator.pushAndRemoveUntil(
            context,
            HomeNavigationMenu.route(),
            (route) => false,
          );
        }
        if (state is UserModelNotFoundState) {
          Navigator.pushAndRemoveUntil(
            context,
            WelcomePage.route(),
            (route) => false,
          );
        }
      },
      child: const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: AppLogo(),
            ),
          ],
        ),
      ),
    );
  }
}
