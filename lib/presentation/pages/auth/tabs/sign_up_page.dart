import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../blocs/events/tabs_event.dart';
import '../../../blocs/tabs_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).primaryColor;

    final navigation = Provider.of<NavigationService>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Text(
                  'Create your wealth with us',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 32),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Your email address',
                    prefixIcon: AppIcons.getIcon(
                      AppIconsEnum.envelope,
                      textColor,
                      24,
                    ),
                    hintText: 'john.doe@domain.com',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Create a strong password',
                    prefixIcon: AppIcons.getIcon(
                      AppIconsEnum.lock,
                      textColor,
                      24,
                    ),
                    hintText: 'Qwerty123!',
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    navigation.navigate(Routes.main);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.white : Colors.black,
                    foregroundColor: isDark ? Colors.black : Colors.white,
                  ),
                  child: Text('Continue'),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR', style: TextStyle(color: textColor)),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                SizedBox(height: 16),
                _buildOAuthButton(
                  'Continue with Google',
                  AppIcons.getIcon(AppIconsEnum.google, textColor, 16),
                  textColor,
                ),
                SizedBox(height: 8),
                _buildOAuthButton(
                  'Continue with Apple',
                  AppIcons.getIcon(AppIconsEnum.apple, textColor, 16),
                  textColor,
                ),
                SizedBox(height: 8),
                _buildOAuthButton(
                  'Continue with Microsoft',
                  AppIcons.getIcon(AppIconsEnum.microsoft, textColor, 16),
                  textColor,
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR', style: TextStyle(color: textColor)),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    context.read<TabBloc>().add(TabChange(1));
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: textColor,
                    side: BorderSide(color: textColor),
                  ),
                  child: Text('Sign In'),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOAuthButton(String text, Widget icon, Color color) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: icon,
      label: Text(text, style: TextStyle(color: color)),
    );
  }
}
