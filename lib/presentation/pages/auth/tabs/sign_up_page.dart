import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../data/datasources/api_connector.dart';
import '../../../../domain/dtos/jwt_response_dto.dart';
import '../../../../domain/dtos/sign_in_dto.dart';
import '../../../blocs/events/tabs_event.dart';
import '../../../blocs/tabs_bloc.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<String?> emailError = ValueNotifier<String?>(null);

  final ValueNotifier<String?> passwordError = ValueNotifier<String?>(null);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).primaryColor;
    final navigation = Provider.of<NavigationService>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder<bool>(
            valueListenable: isLoading,
            builder: (context, loading, child) {
              if (loading) {
                return SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              }

              return Container(
                constraints: BoxConstraints(maxWidth: 600),
                padding: EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                    Text(
                      'Create your wealth with us!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 32),
                    TextField(
                      controller: emailController,
                      onChanged: (value) {
                        if (!_validateEmail(value)) {
                          emailError.value =
                              'Please enter a valid email address';
                        } else {
                          emailError.value = null;
                        }
                      },
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
                    ValueListenableBuilder<String?>(
                      valueListenable: emailError,
                      builder:
                          (context, error, child) => Visibility(
                            visible: error != null,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, left: 8),
                              child: Text(
                                error ?? '',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      onChanged: (value) {
                        if (!_validatePassword(value)) {
                          passwordError.value =
                              'Must contain 8 chars, uppercase, lowercase, digit, special';
                        } else {
                          passwordError.value = null;
                        }
                      },
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
                    ValueListenableBuilder<String?>(
                      valueListenable: passwordError,
                      builder:
                          (context, error, child) => Visibility(
                            visible: error != null,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, left: 8),
                              child: Text(
                                error ?? '',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        final username = emailController.text;
                        final password = passwordController.text;

                        if (!_validateEmail(username)) {
                          emailError.value =
                              'Please enter a valid email address';
                          return;
                        }

                        if (!_validatePassword(password)) {
                          passwordError.value =
                              'Must contain 8 chars, uppercase, lowercase, digit, special';
                          return;
                        }

                        Response response =
                            await ApiConnector.post<JwtResponseDto>(
                              Uri.parse('/api/auth/sign-in'),
                              SignInDto(username, password).toObject(),
                            );

                        if (response.statusCode == 201) {
                          return await navigation.navigate((Routes.main));
                        }

                        emailController.clear();
                        passwordController.clear();
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
                      onPressed: () async {
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
              );
            },
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

  bool _validateEmail(String value) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value);
  }

  bool _validatePassword(String value) {
    return RegExp(
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$",
    ).hasMatch(value);
  }
}
