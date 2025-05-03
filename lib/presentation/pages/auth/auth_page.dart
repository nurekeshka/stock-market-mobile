import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/routes.dart';
import '../../../core/services/navigation_service.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationService>(context);

    return Center(
      child: TextButton(
        child: Text("Click to navigate!"),
        onPressed: () => {navigation.navigate(Routes.main)},
      ),
    );
  }
}
