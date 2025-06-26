import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Map<AppIconsEnum, String> icons = {
  AppIconsEnum.announcements: 'announcements',
  AppIconsEnum.apple: 'apple',
  AppIconsEnum.charts: 'charts',
  AppIconsEnum.compas: 'compas',
  AppIconsEnum.data: 'data',
  AppIconsEnum.envelope: 'envelope',
  AppIconsEnum.google: 'google',
  AppIconsEnum.home: 'home',
  AppIconsEnum.lense: 'lense',
  AppIconsEnum.lock: 'lock',
  AppIconsEnum.microsoft: 'microsoft',
  AppIconsEnum.suitcase: 'suitcase',
};

class AppIcons {
  static String iconsPath = 'assets/icons';

  static Widget getIcon(AppIconsEnum icon, Color color, double size) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        getIconPath(icon),
        semanticsLabel: icons[icon],
        width: size,
        height: size,
        // ignore: deprecated_member_use
        color: color,
      ),
    );
  }

  static String getIconPath(AppIconsEnum icon) {
    return '$iconsPath/${icons[icon]}.svg';
  }
}

enum AppIconsEnum {
  announcements,
  apple,
  charts,
  compas,
  data,
  envelope,
  google,
  home,
  lense,
  lock,
  microsoft,
  suitcase,
}
