import 'package:flutter/material.dart';

import '../util/app_logger.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    appLogger.d('Pushed route: ${route.settings.name}', time: null);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    appLogger.d('Popped route: ${route.settings.name}', time: null);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    appLogger.d('Removed route: ${route.settings.name}', time: null);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    appLogger.d(
      'Replaced route: ${oldRoute?.settings.name} with ${newRoute?.settings.name}',
      time: null,
    );
  }
}
