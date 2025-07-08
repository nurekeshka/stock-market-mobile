import 'package:flutter/material.dart';
import 'package:stock_market_mobile/core/theme/colors.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color background =
        isDark
            ? DesignColors.electromagnetic.color
            : DesignColors.lynxWhite.color;

    final Color cardColor =
        isDark
            ? DesignColors.electromagnetic.color
            : DesignColors.lynxWhite.color;

    final Color textColor =
        isDark
            ? DesignColors.lynxWhite.color
            : DesignColors.electromagnetic.color;

    final Color iconColor =
        isDark
            ? DesignColors.lynxWhite.color
            : DesignColors.electromagnetic.color;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    "Unlock Premium Features",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "More insights. No ads. Exclusive tools",
                    style: TextStyle(fontSize: 14, color: iconColor),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Upgrade Now",
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildFeature(
              icon: Icons.query_stats,
              label: "Advanced analytics & trends",
              iconColor: iconColor,
              textColor: textColor,
            ),
            _buildFeature(
              icon: Icons.block,
              label: "Ad-free experience",
              iconColor: iconColor,
              textColor: textColor,
            ),
            _buildFeature(
              icon: Icons.notifications_active_outlined,
              label: "Real-time alerts",
              iconColor: iconColor,
              textColor: textColor,
            ),
            _buildFeature(
              icon: Icons.campaign_outlined,
              label: "Early access to market events",
              iconColor: iconColor,
              textColor: textColor,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Monthly",
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Yearly 15%",
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Premium €9.99/month",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Subscribe",
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature({
    required IconData icon,
    required String label,
    required Color iconColor,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 15, color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
