import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

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
      displayLarge: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.sp,
      ),
      displayMedium: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w600,
        letterSpacing: .5,
        fontSize: 25.sp,
      ),
      displaySmall: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 23.sp,
      ),

      headlineLarge: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.sp,
      ),
      headlineMedium: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
      ),
      //LoginPage TextField
      headlineSmall: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 19.sp,
      ),

      titleLarge: TextStyle(
        color: _color.primaryText,
        fontSize: 18.sp,
      ),
      titleMedium: TextStyle(
        color: _color.primaryText,
        fontSize: 17.sp,
      ),
      titleSmall: TextStyle(
        color: _color.primaryText,
        fontSize: 16.sp,
      ),

      labelLarge: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
      ),
      labelMedium: TextStyle(
        color: _color.primaryText,
        fontSize: 14.sp,
      ),
      labelSmall: TextStyle(
        color: _color.primaryText,
        fontSize: 13.sp,
      ),

      bodyLarge: TextStyle(
        color: _color.secondaryText,
        fontSize: 14.sp,
        // fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: _color.secondaryText,
        fontSize: 13.sp,
      ),
      bodySmall: TextStyle(
        color: _color.secondaryText,
        fontSize: 12.sp,
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
        borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _color.primaryText.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _color.primaryText.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _color.primaryText.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
      ),
    ),
    iconTheme: IconThemeData(
      color: _color.iconColor,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: _color.background,
      surfaceTintColor: Colors.transparent,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: _color.iconColor,
    ),
  );
}