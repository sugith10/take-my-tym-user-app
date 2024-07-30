import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'core/observer/navigator_observer.dart';
import 'core/route/app_route_packages.dart';
import 'core/route/route_name/app_route_name.dart';
import 'core/theme/app_theme.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    String? screen;
    OneSignal.Notifications.addClickListener((event){
      final data = event.notification.additionalData;
      screen = data?['screen'];
      if(screen != null){
        navigatorKey.currentState?.pushNamed(screen!);
      }
    });
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      minTextAdapt: false,
      fontSizeResolver: FontSizeResolvers.radius,
      child: Builder(builder: (context) {
        return MaterialApp(
          title: "Take My Tym",
          initialRoute: RouteName.initial,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRoute.generateRoute,
          navigatorObservers: [AppNavigatorObserver()],
          theme: AppDarkTheme.darkTheme,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
