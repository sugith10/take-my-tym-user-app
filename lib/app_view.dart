import 'package:flutter/material.dart';
import 'package:take_my_tym/features/auth/presentation/pages/welcome_page.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}