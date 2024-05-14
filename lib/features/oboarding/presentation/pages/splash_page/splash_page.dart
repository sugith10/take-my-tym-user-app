import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../../core/widgets/app_logo.dart';
import '../../../../auth/presentation/pages/welcome_page.dart';
import '../../../../navigation_menu/presentation/pages/home_navigation_menu.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.read<AppUserBloc>().add(EnsureUserModelExistsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppUserBloc, AppState>(
      listener: (context, state) {
        log(state.toString());
        if (state is UserModelUpdatedState) {
          log(state.toString());
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
