import 'package:flutter/material.dart';

import '../constants/routes.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  factory NavigationService() => _instance;

  NavigationService._internal();

  void assertNavigatorState() {
    assert(navigatorKey.currentState != null, 'NavigatorState is null!');
  }

  Future<dynamic> navigate(Routes route, {Object? arguments}) {
    assertNavigatorState();
    return navigatorKey.currentState!.pushNamed(
      route.path,
      arguments: arguments,
    );
  }

  Future<dynamic> replace(Routes route, {Object? arguments}) {
    assertNavigatorState();
    return navigatorKey.currentState!.pushReplacementNamed(
      route.path,
      arguments: arguments,
    );
  }

  void revert() {
    assertNavigatorState();
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }
}
