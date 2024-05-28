import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/route/app_route_packages.dart';
import 'core/route/route_name/app_route_name.dart';
import 'core/theme/app_theme.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      minTextAdapt: false,
      fontSizeResolver: FontSizeResolvers.radius,
      child: Builder(builder: (context) {
        return MaterialApp(
          title: "Take My Tym",
          initialRoute: RouteName.initial,
          onGenerateRoute: AppRoute.generateRoute,
          theme: AppDarkTheme().darkTheme,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
