import 'package:flutter/material.dart';

import '../theme/themes.dart';

class ThemeService extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeData get currentTheme {
    return currentThemeMode == ThemeMode.light ? Themes.light : Themes.dark;
  }

  ThemeMode get currentThemeMode {
    if (_themeMode == ThemeMode.system) {
      return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    }

    return _themeMode;
  }

  ThemeMode get themeMode => _themeMode;

  void set(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void toggle() {
    _themeMode =
        currentThemeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
