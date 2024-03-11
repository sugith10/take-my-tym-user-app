import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

final MyAppDarkColor _color = MyAppDarkColor();

final class MyAppDarkTheme {
  final ThemeData darkTheme = ThemeData(
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.light(
        background: _color.background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: _color.buttonBackground,
              foregroundColor: _color.buttonForground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(50, 50),
              animationDuration: const Duration(milliseconds: 200))));
}
