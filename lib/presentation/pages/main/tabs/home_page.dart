import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_mobile/core/services/navigation_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationService>(context);

    return Center(
      child: TextButton(
        child: Text("Click to change!"),
        onPressed: () => {navigation.revert()},
      ),
    );
  }
}
