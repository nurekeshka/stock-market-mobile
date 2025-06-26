import 'dart:ui';

final Map<DesignColors, Color> designColorsMap = {
  DesignColors.nasturcianFlower: Color.fromRGBO(232, 65, 24, 1),
  DesignColors.harleyDavidsonOrange: Color.fromRGBO(194, 54, 22, 1),
  DesignColors.blueNights: Color.fromRGBO(53, 59, 72, 1),
  DesignColors.electromagnetic: Color.fromRGBO(47, 54, 64, 1),
  DesignColors.lynxWhite: Color.fromRGBO(245, 246, 250, 1),
  DesignColors.hintOfPensive: Color.fromRGBO(220, 221, 225, 1),
  DesignColors.pureGolden: Color.fromRGBO(248, 181, 0, 1),
  DesignColors.skirretGreen: Color.fromRGBO(68, 189, 50, 1),
};

enum DesignColors {
  nasturcianFlower,
  harleyDavidsonOrange,
  blueNights,
  electromagnetic,
  lynxWhite,
  hintOfPensive,
  pureGolden,
  skirretGreen,
}

extension DesignColorsExtension on DesignColors {
  Color get color {
    return designColorsMap[this] ?? const Color(0xFF000000);
  }
}
