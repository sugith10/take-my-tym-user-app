import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/app_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      minTextAdapt: false,
      fontSizeResolver: FontSizeResolvers.radius,
      builder: (context, child) {
        return const MyAppView();
      }
    );
  }
}
