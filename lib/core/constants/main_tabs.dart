import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

const Map<Tabs, Tuple2<Icon, String>> tabs = {
  Tabs.home: Tuple2(Icon(Icons.home), "Home"),
  Tabs.browse: Tuple2(Icon(Icons.search), "Browse"),
  Tabs.charts: Tuple2(Icon(Icons.pie_chart), "Charts"),
  Tabs.events: Tuple2(Icon(Icons.event), "Events"),
};

enum Tabs { home, browse, charts, events }
