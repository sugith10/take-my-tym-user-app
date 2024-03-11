import 'package:flutter/material.dart';

interface class AppColors {
  final Color background;
  final Color primaryText;
  final Color secondaryText;
  final Color buttonBackground;
  final Color buttonForground;
  AppColors({
    required this.background,
    required this.primaryText,
    required this.secondaryText,
    required this.buttonBackground,
    required this.buttonForground,
  });
}

class MyAppDarkColor extends AppColors {
  MyAppDarkColor()
      : super(
            background: const Color(0xFF121212),
            primaryText: const Color.fromARGB(255, 255, 255, 255),
            secondaryText: const Color.fromARGB(70, 190, 190, 190),
            buttonBackground: const Color.fromRGBO(255, 255, 255, 1),
            buttonForground: const Color.fromRGBO(0, 0, 0, 1));
}
