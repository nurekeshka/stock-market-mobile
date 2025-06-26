import 'package:stock_market_mobile/core/constants/icons.dart';
import 'package:tuple/tuple.dart';

const Map<Tabs, Tuple2<AppIconsEnum, String>> tabs = {
  Tabs.home: Tuple2(AppIconsEnum.home, "Home"),
  Tabs.browse: Tuple2(AppIconsEnum.lense, "Browse"),
  Tabs.charts: Tuple2(AppIconsEnum.charts, "Charts"),
  Tabs.events: Tuple2(AppIconsEnum.announcements, "Events"),
};

enum Tabs { home, browse, charts, events }
