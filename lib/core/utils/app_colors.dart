import 'package:flutter/material.dart';

interface class AppColor {
  final Color background;
  final Color softBackground;
  final Color secondaryBackground;
  final Color pure;
  final Color primaryText;
  final Color primaryTextBlur;
  final Color secondaryText;
  final Color buttonBackground;
  final Color buttonForground;
  final Color bottomNavigationBarBackground;
  final Color iconColor;
  final Color gradientPrimary;
  final Color gradientSecondary;
  final Color boxShadow;
  final Color progressIndicatorColor;
  final Color glassEffect;
  final Color danger;
  AppColor({
    required this.background,
    required this.softBackground,
    required this.secondaryBackground,
    required this.pure,
    required this.primaryText,
    required this.primaryTextBlur,
    required this.secondaryText,
    required this.buttonBackground,
    required this.buttonForground,
    required this.bottomNavigationBarBackground,
    required this.iconColor,
    required this.gradientPrimary,
    required this.gradientSecondary,
    required this.boxShadow,
    required this.progressIndicatorColor,
    required this.glassEffect,
    required this.danger,
  });
}

final class MyAppDarkColor extends AppColor {
  MyAppDarkColor()
      : super(
          background: const Color(0xFF121212),
          softBackground: const Color.fromARGB(255, 25, 25, 25),
          secondaryBackground: const Color(0xFF1A1B1A),
          pure: const Color.fromRGBO(0, 0, 0, 1),
          primaryText: const Color.fromARGB(255, 255, 255, 255),
          primaryTextBlur: const Color.fromARGB(202, 255, 255, 255),
          secondaryText: const Color.fromARGB(222, 160, 160, 160),
          buttonBackground: const Color.fromRGBO(255, 255, 255, 1),
          buttonForground: const Color.fromRGBO(0, 0, 0, 1),
          bottomNavigationBarBackground: const Color.fromRGBO(35, 35, 35, 35),
          iconColor: const Color.fromARGB(255, 255, 255, 255),
          gradientPrimary: const Color.fromRGBO(78, 78, 78, 1),
          gradientSecondary: const Color.fromRGBO(0, 0, 0, 1),
          boxShadow: const Color.fromARGB(66, 255, 255, 255),
          progressIndicatorColor: const Color.fromRGBO(255, 255, 255, 1),
          glassEffect: const Color.fromARGB(95, 0, 0, 0),
          danger: const Color.fromRGBO(244, 67, 54, 1),
        );
}
