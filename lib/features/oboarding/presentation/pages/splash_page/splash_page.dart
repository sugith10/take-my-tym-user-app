import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/widgets/app_logo.dart';
import 'package:take_my_tym/features/auth/presentation/pages/welcome_page.dart';
import 'package:take_my_tym/features/navigation_menu/presentation/pages/navigation_menu.dart';

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
      context.read<AppUserBloc>().add(EnsureAppUserModelExistsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppUserBloc, AppState>(
      listener: (context, state) {
        log(state.toString());
        if (state is UserModelUpdatedState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const NavigationMenu(),
            ),
            (route) => false,
          );
        }
        if (state is UserModelNotFoundState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const WelcomePage(),
            ),
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
              child: Hero(tag: 'AppLogo', child: AppLogo()),
            ),
          ],
        ),
      ),
    );
  }
}
