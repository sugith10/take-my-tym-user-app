import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        minimumSize: Size(50.sp, 50.sp),
        maximumSize: Size(500.sp, 100.sp),
        animationDuration: const Duration(milliseconds: 200),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: _color.primaryText,
        fontSize: 28.sp,
        fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        color: _color.primaryText,
        fontSize: 22.sp,
      ),
      bodySmall: TextStyle(
        fontSize: 20.sp,
      ),
      headlineLarge: TextStyle(
        fontSize: 18.sp,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.sp,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.sp,
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
      ),
      labelMedium: TextStyle(
        color: _color.secondaryText,
        fontSize: 14.sp,
      ),
      labelSmall: TextStyle(
        color: _color.secondaryText,
        decorationColor: _color.secondaryText,
        fontSize: 12.sp,
      ),
    ),
    dividerTheme: DividerThemeData(color: _color.secondaryText),
    appBarTheme: AppBarTheme(
      
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: Colors.grey,
      foregroundColor: _color.primaryText,
    ),
  );
}
