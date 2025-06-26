import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './core/constants/routes.dart';
import './core/services/navigation_service.dart';
import './core/services/theme_service.dart';
import './core/theme/themes.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeService>(context);
    final navigation = Provider.of<NavigationService>(context);

    return MaterialApp(
      routes: routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: themes.themeMode,
      initialRoute: Routes.auth.path,
      navigatorKey: navigation.navigatorKey,
    );
  }
}
