import 'package:flutter/material.dart';

interface class AppColor {
  final Color background;
  final Color softBackground;
  final Color secondaryBackground;
  final Color pure;
  final Color primaryText;
  final Color primaryTextSoft;
  final Color primaryTextBlur;
  final Color secondaryText;
  final Color buttonBackground;
  final Color buttonForground;
  final Color bottomNavigationBarBackground;
  final Color iconColor;
  final Color gradientPrimary;
  final Color gradientSecondary;
  final Color boxShadow;
  final Color primaryBorder;
  final Color primarySoftBorder;
  final Color secondaryBorder;
  final Color progressIndicatorColor;
  final Color glassEffect;
  final Color danger;
  final Color fillColor;
  final Color userChatColor;
  final Color recipientChatColor;
  final Color success;
  final Color bottomSheet;
  AppColor({
    required this.background,
    required this.softBackground,
    required this.secondaryBackground,
    required this.pure,
    required this.primaryText,
    required this.primaryTextSoft,
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
    required this.primaryBorder,
    required this.primarySoftBorder,
    required this.secondaryBorder,
    required this.fillColor,
    required this.userChatColor,
    required this.recipientChatColor,
    required this.success,
    required this.bottomSheet,
  });
}

final class MyAppDarkColor extends AppColor {
  static MyAppDarkColor? _instance;
  static MyAppDarkColor get instance {
    _instance ??= MyAppDarkColor._();
    return _instance!;
  }

  MyAppDarkColor._()
      : super(
          background: const Color.fromRGBO(18, 18, 18, 1),
          softBackground: const Color.fromARGB(255, 25, 25, 25),
          secondaryBackground: const Color(0xFF1A1B1A),
          pure: const Color.fromRGBO(0, 0, 0, 1),
          primaryText: const Color.fromARGB(255, 255, 255, 255),
          primaryTextSoft:
              const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.9),
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
          primaryBorder: const Color.fromRGBO(255, 255, 255, 1),
          primarySoftBorder: const Color.fromARGB(116, 255, 255, 255),
          secondaryBorder: const Color.fromARGB(66, 255, 255, 255),
          fillColor: const Color.fromARGB(237, 53, 53, 53).withOpacity(0.5),
          userChatColor: const Color.fromRGBO(129, 199, 132, 1),
          recipientChatColor: const Color.fromARGB(255, 30, 110, 186),
          success: const Color.fromRGBO(76, 175, 80, 1),
          bottomSheet: const Color(0xFF2C2C2C),
        );
}
