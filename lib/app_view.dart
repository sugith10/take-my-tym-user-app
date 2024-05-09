import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_theme.dart';

import 'features/oboarding/presentation/pages/splash_page/splash_page.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      minTextAdapt: false,
      fontSizeResolver: FontSizeResolvers.radius,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: "Take My Tym", 
            home: const SplashPage(),
            theme: AppDarkTheme().darkTheme,
            debugShowCheckedModeBanner: false,
          );
        }
      ),
    );
  }
}
