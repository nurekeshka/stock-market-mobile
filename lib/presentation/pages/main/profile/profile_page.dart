import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_mobile/core/constants/routes.dart';

import '../../../../core/services/navigation_service.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onClose;

  const ProfileScreen({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationService>(context);

    return Material(
      color: Colors.transparent, // Needed for blur effect
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: onClose,
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/angela.png'),
              ),
              SizedBox(height: 10),
              Text(
                "Angella Müller",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 4),
              Text(
                "Username: AngellaM",
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                "Email: angella.muller@gamil.com",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  navigation.replace(Routes.premium);
                },
                child: Text('Premium'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
