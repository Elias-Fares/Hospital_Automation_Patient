import 'package:flutter/material.dart';

class MyGoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('Navigated to: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('Popped: ${route.settings.name}');
  }
  
}
