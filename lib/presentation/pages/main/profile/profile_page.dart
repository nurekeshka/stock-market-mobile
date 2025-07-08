import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_mobile/core/constants/routes.dart';
import 'package:stock_market_mobile/core/services/theme_service.dart';
import 'package:stock_market_mobile/core/theme/colors.dart';

import '../../../../core/services/navigation_service.dart';
import '../../../../core/services/storage_service.dart';

class ProfilePage extends StatelessWidget {
  final String username = "AngellaM";
  final String email = "angella.muller@gmail.com";
  final VoidCallback onClose;

  const ProfilePage({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context);
    final navigate = Provider.of<NavigationService>(context);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final cardColor = Colors.transparent;
    final textColor = DesignColors.lynxWhite.color;
    final iconColor = DesignColors.lynxWhite.color;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: DesignColors.lynxWhite.color),
                  onPressed: onClose,
                ),
              ),
              // Profile Header
              Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/angela.png'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Angella Müller',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Username: $username\nEmail: $email',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: iconColor),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Personal Details Section
              _sectionTitle(
                'Personal details',
                icon: Icons.info_outline,
                color: iconColor,
              ),
              const SizedBox(height: 8),
              _profileActionCard(context, cardColor, textColor, iconColor, [
                _settingRow(
                  icon: Icons.location_on_outlined,
                  label: "Change address",
                  textColor: textColor,
                ),
                _settingRow(
                  icon: Icons.lock_outline,
                  label: "Change password",
                  textColor: textColor,
                ),
                _settingRow(
                  icon: Icons.mail_outline,
                  label: "Change email",
                  textColor: textColor,
                ),
                _settingRow(
                  icon: Icons.phone_android_outlined,
                  label: "Change phone number",
                  textColor: textColor,
                ),
              ]),
              const SizedBox(height: 20),

              // App Settings Section
              _sectionTitle(
                'App Settings',
                icon: Icons.settings_outlined,
                color: iconColor,
              ),
              const SizedBox(height: 8),
              _profileActionCard(context, cardColor, textColor, iconColor, [
                _switchRow(label: "Dark mode", value: isDark, theme: theme),
                _settingRow(
                  icon: Icons.language,
                  label: "Languages",
                  textColor: textColor,
                  trailing: _languageBox(),
                ),
                _settingRow(
                  icon: Icons.feedback_outlined,
                  label: "Feedback",
                  textColor: textColor,
                ),
                _settingRow(
                  icon: Icons.help_outline,
                  label: "Help",
                  textColor: textColor,
                ),
              ]),

              const Spacer(),

              // Bottom Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _actionButton(
                    "Upgrade Premium",
                    textColor: textColor,
                    onPressed: () {
                      navigate.navigate(Routes.premium);
                    },
                  ),
                  _actionButton(
                    "Sign Out",
                    textColor: textColor,
                    onPressed: () async {
                      final storage = Provider.of<StorageService>(
                        context,
                        listen: false,
                      );
                      final navigation = Provider.of<NavigationService>(
                        context,
                        listen: false,
                      );
                      await storage.delete(HiveKeysEnum.accessToken);
                      navigation.navigate(
                        Routes.auth,
                      ); // or your actual auth route
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton(
    String label, {
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: textColor,
            side: BorderSide(color: textColor),
          ),
          child: Text(label),
        ),
      ),
    );
  }

  Widget _languageBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text("EN", style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _profileActionCard(
    BuildContext context,
    Color cardColor,
    Color textColor,
    Color iconColor,
    List<Widget> children,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: iconColor.withOpacity(0.2)),
      ),
      child: Column(children: children),
    );
  }

  Widget _sectionTitle(
    String title, {
    required IconData icon,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }

  Widget _settingRow({
    required IconData icon,
    required String label,
    required Color textColor,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label, style: TextStyle(color: textColor)),
      iconColor: textColor,
      trailing: trailing,
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _switchRow({
    required String label,
    required bool value,
    required ThemeService theme,
  }) {
    return ListTile(
      leading: const Icon(Icons.dark_mode),
      textColor: DesignColors.lynxWhite.color,
      iconColor: DesignColors.lynxWhite.color,
      title: Text(label),
      trailing: Switch(
        activeColor: DesignColors.electromagnetic.color,
        activeTrackColor: DesignColors.lynxWhite.color,
        inactiveThumbColor: DesignColors.electromagnetic.color,
        inactiveTrackColor: DesignColors.lynxWhite.color,
        value: value,
        onChanged:
            (value) => theme.set(value ? ThemeMode.dark : ThemeMode.light),
      ),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
