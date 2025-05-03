import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './application.dart';
import './core/services/navigation_service.dart';
import './core/services/theme_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeService()),
        Provider(create: (_) => NavigationService()),
      ],
      child: const Application(),
    ),
  );
}
