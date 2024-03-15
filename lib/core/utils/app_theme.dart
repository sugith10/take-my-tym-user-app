import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';

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
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: _color.primaryText,
        fontSize: 22.sp,
      ),
      bodySmall: TextStyle(
        color: _color.primaryText,
        fontSize: 20.sp,
      ),
      headlineLarge: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 19.sp,
      ),
      headlineMedium: TextStyle(
        color: _color.primaryText,
        fontSize: 18.sp,
      ),
      //LoginPage TextField
      headlineSmall: TextStyle(
        color: _color.background,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      //PostedContents
      labelLarge: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
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
      titleLarge: TextStyle(
        color: _color.primaryText,
        fontSize: 12.sp,
      ),
      titleMedium: TextStyle(
        color: _color.primaryText,
        fontSize: 11.sp,
      ),
      titleSmall: TextStyle(
        color: _color.primaryText,
        fontSize: 10.sp,
      ),
    ),
    dividerTheme: DividerThemeData(color: _color.secondaryText),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: _color.background,
      foregroundColor: _color.primaryText,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: _color.bottomNavigationBarBackground,
      elevation: 0,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return TextStyle(color: _color.primaryText, fontSize: 14.sp);
        } else {
          return TextStyle(
            color: _color.secondaryText,
            fontSize: 14.sp,
          );
        }
      }),
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(
            color: _color.background,
          );
        } else {
          return IconThemeData(
            color: _color.secondaryText,
          );
        }
      }),
      indicatorColor: _color.primaryText,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _color.primaryText.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(MyAppPadding.borderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _color.primaryText.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(MyAppPadding.borderRadius),
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}
