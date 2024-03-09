import 'package:flutter/material.dart';
import 'package:take_my_tym/core/navigation/app_router.dart';
import 'package:take_my_tym/features/auth/presentation/pages/welcome_page.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Take My Tym",
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}