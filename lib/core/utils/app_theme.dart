import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_assets/app_font.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_radius.dart';

final class AppDarkTheme {
  static final AppDarkColor _color = AppDarkColor.instance;
  static final ScreenUtil _screenUtil = ScreenUtil();

  static final _outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: _color.primaryText.withOpacity(0.3)),
    borderRadius: BorderRadius.circular(MyAppRadius.borderRadius),
  );

  final ThemeData darkTheme = ThemeData(
    fontFamily: MyAppFonst.poppins,
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
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          _color.primaryTextSoft,
        ),
        overlayColor: MaterialStatePropertyAll(
          _color.glassEffect,
        ),
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
        fontSize: 15.sp,
      ),
      labelMedium: TextStyle(
        color: _color.primaryText,
        fontSize: _screenUtil.setSp(14),
      ),
      labelSmall: TextStyle(
        color: _color.primaryText,
        fontSize: 13.sp,
      ),
      bodyLarge: TextStyle(
        color: _color.secondaryText,
        fontSize: _screenUtil.setSp(14),
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
      backgroundColor: _color.bottomBar,
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
        enabledBorder: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder,
        focusedErrorBorder: _outlineInputBorder,
        errorStyle: TextStyle(
          color: _color.primaryTextSoft,
        )),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: _color.primaryText,
      cursorColor: _color.primaryText,
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
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: _color.progressIndicatorColor,
    ),
    dialogBackgroundColor: _color.softBackground,
    dialogTheme: DialogTheme(
      backgroundColor: _color.softBackground,
      surfaceTintColor: Colors.transparent,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: _color.softBackground,
      shadowColor: _color.softBackground,
      surfaceTintColor: _color.softBackground,
      elevation: 10,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      backgroundColor: _color.bottomSheet,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(
        color: _color.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),
      unselectedLabelStyle: TextStyle(
        color: _color.secondaryText,
        fontSize: 16.sp,
      ),
      dividerColor: _color.secondaryBorder,
      indicatorColor: _color.primaryBorder,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      textColor: _color.primaryText,
      backgroundColor: _color.softBackground,
      iconColor: _color.iconColor,
      collapsedBackgroundColor: _color.softBackground,
      collapsedTextColor: _color.primaryTextSoft,
      collapsedIconColor: _color.primaryTextSoft,
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
