import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './core/theme/themes.dart';
import './core/theme/theme_notifier.dart';
import './presentation/pages/main/main_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      home: const MainPage(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: themes.themeMode,
    );
  }
}
