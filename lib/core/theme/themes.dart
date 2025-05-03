import 'package:flutter/material.dart';
import 'package:stock_market_mobile/core/theme/colors.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: DesignColors.electromagnetic.color,
    appBarTheme: AppBarTheme(
      backgroundColor: DesignColors.electromagnetic.color,
      foregroundColor: DesignColors.lynxWhite.color,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateColor.fromMap({
          WidgetState.any: DesignColors.blueNights.color,
        }),
        backgroundColor: WidgetStateColor.fromMap({
          WidgetState.any: DesignColors.lynxWhite.color,
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.fromMap({
          WidgetState.any: DesignColors.blueNights.color,
        }),
        foregroundColor: WidgetStateColor.fromMap({
          WidgetState.any: DesignColors.lynxWhite.color,
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DesignColors.blueNights.color,
      selectedItemColor: DesignColors.lynxWhite.color,
      unselectedItemColor: DesignColors.hintOfPensive.color,
    ),
  );
}
