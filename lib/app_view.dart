import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_theme.dart';
import 'package:take_my_tym/features/oboarding/presentation/pages/splash_page/splash_page.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Take My Tym",
      home: const SplashPage(),
      theme: MyAppDarkTheme().darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}