import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/theme_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);

    return Center(
      child: TextButton(
        child: Text("Click me!"),
        onPressed: () => {theme.toggleTheme(false)},
      ),
    );
  }
}
