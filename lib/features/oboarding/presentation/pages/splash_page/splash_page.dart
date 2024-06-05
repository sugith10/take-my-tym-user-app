import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../../core/route/route_name/app_route_name.dart';
import '../../../../../core/widgets/app_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AppUserBloc, AppState>(
      listener: (context, state) {
        if (state is UserModelUpdatedState) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.home, (route) => false);
        }
        if (state is UserModelNotFoundState) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.welcome, (route) => false);
        }
      },
      child: Scaffold(
        
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(25),
                child: AppLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
