import 'package:flutter/material.dart';
import 'package:stock_market_mobile/core/theme/colors.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: DesignColors.electromagnetic.color,
    scaffoldBackgroundColor: DesignColors.lynxWhite.color,
    appBarTheme: AppBarTheme(
      backgroundColor: DesignColors.lynxWhite.color,
      foregroundColor: DesignColors.electromagnetic.color,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DesignColors.lynxWhite.color,
      selectedItemColor: DesignColors.electromagnetic.color,
      unselectedItemColor: DesignColors.electromagnetic.color,
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
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(),
      hintStyle: TextStyle(color: DesignColors.electromagnetic.color),
    ),
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DesignColors.lynxWhite.color,
    scaffoldBackgroundColor: DesignColors.electromagnetic.color,
    appBarTheme: AppBarTheme(
      backgroundColor: DesignColors.electromagnetic.color,
      foregroundColor: DesignColors.lynxWhite.color,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DesignColors.electromagnetic.color,
      selectedItemColor: DesignColors.lynxWhite.color,
      unselectedItemColor: DesignColors.lynxWhite.color,
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
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(),
      hintStyle: TextStyle(color: DesignColors.electromagnetic.color),
    ),
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );
}
