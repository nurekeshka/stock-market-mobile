import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_mobile/core/services/navigation_service.dart';
import 'package:stock_market_mobile/core/services/storage_service.dart';

import '../../../core/constants/routes.dart';
import '../../blocs/states/tabs_state.dart';
import '../../blocs/tabs_bloc.dart';
import './tabs/sign_in_page.dart';
import './tabs/sign_up_page.dart';

class AuthPage extends StatelessWidget {
  final List<Widget> pages = [SignUpPage(), SignInPage()];

  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationService>(context);
    final storage = Provider.of<StorageService>(context);

    return FutureBuilder(
      future: storage.get(HiveKeysEnum.accessToken),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final access = snapshot.data;

        if (access != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            navigation.navigate(Routes.main);
          });
          return const SizedBox.shrink();
        }

        return BlocProvider(
          create: (_) => TabBloc(),
          child: BlocBuilder<TabBloc, TabState>(
            builder: (context, state) {
              return pages[state.currentIndex];
            },
          ),
        );
      },
    );
  }
}
