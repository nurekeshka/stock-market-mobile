import 'dart:ui';

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
    switch (this) {
      case DesignColors.nasturcianFlower:
        return const Color.fromRGBO(232, 65, 24, 1);
      case DesignColors.harleyDavidsonOrange:
        return const Color.fromRGBO(194, 54, 22, 1);
      case DesignColors.blueNights:
        return const Color.fromRGBO(53, 59, 72, 1);
      case DesignColors.electromagnetic:
        return const Color.fromRGBO(47, 54, 64, 1);
      case DesignColors.lynxWhite:
        return const Color.fromRGBO(245, 246, 250, 1);
      case DesignColors.hintOfPensive:
        return const Color.fromRGBO(220, 221, 225, 1);
      case DesignColors.pureGolden:
        return const Color.fromRGBO(248, 181, 0, 1);
      case DesignColors.skirretGreen:
        return const Color.fromRGBO(68, 189, 50, 1);
    }
  }
}
