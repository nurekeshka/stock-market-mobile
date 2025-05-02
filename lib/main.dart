import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './core/theme/theme_notifier.dart';
import './application.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeNotifier())],
      child: Application(),
    ),
  );
}
