import 'package:flutter/material.dart';

import '../../presentation/pages/auth/auth_page.dart';
import '../../presentation/pages/main/main_page.dart';

final Map<String, WidgetBuilder> routes = {
  Routes.main.path: (context) => MainPage(),
  Routes.auth.path: (context) => AuthPage(),
};

enum Routes { main, auth }

extension RoutesExtension on Routes {
  String get path {
    switch (this) {
      case Routes.main:
        return '/';
      case Routes.auth:
        return '/auth';
    }
  }
}
