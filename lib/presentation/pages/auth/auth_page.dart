import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_mobile/core/services/theme_service.dart';
import 'package:stock_market_mobile/presentation/pages/auth/tabs/sign_in_page.dart';
import 'package:stock_market_mobile/presentation/pages/auth/tabs/sign_up_page.dart';

import '../../blocs/states/tabs_state.dart';
import '../../blocs/tabs_bloc.dart';

class AuthPage extends StatelessWidget {
  final List<Widget> pages = const [SignUpPage(), SignInPage()];

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeService>(context);

    theme.toggle();

    return BlocProvider(
      create: (_) => TabBloc(),
      child: BlocBuilder<TabBloc, TabState>(
        builder: (context, state) {
          return pages[state.currentIndex];
        },
      ),
    );
  }
}
