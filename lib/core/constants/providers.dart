import 'package:provider/provider.dart';
import 'package:stock_market_mobile/core/services/storage_service.dart';

import '../services/navigation_service.dart';
import '../services/theme_service.dart';

final providers = [
  ChangeNotifierProvider(create: (_) => ThemeService()),
  Provider(create: (_) => NavigationService()),
  Provider(create: (_) => StorageService.instance),
];
