import 'package:flutter/material.dart';

class NavigationSevice {
  late GlobalKey<NavigatorState> navigatorKey;
  NavigationSevice() {
    navigatorKey = GlobalKey<NavigatorState>();
  }
  navigate(Widget widget) {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => widget));
  }
}
