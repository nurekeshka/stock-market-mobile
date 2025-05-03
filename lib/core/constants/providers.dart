import 'package:provider/provider.dart';

import '../services/navigation_service.dart';
import '../services/theme_service.dart';

final providers = [
  ChangeNotifierProvider(create: (_) => ThemeService()),
  Provider(create: (_) => NavigationService()),
];
