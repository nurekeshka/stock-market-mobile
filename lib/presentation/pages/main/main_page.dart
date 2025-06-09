import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_mobile/presentation/pages/main/tabs/browse_page.dart';

import '../../blocs/states/tabs_state.dart';
import '../../blocs/tabs_bloc.dart';
import '../../widgets/bottom_navigation_widget.dart';
import './tabs/home_page.dart';

class MainPage extends StatelessWidget {
  final List<Widget> pages = const [
    HomePage(),
    BrowsePage(),
    Center(child: Text('Charts')),
    Center(child: Text('Events')),
  ];

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabBloc(),
      child: Scaffold(
        body: BlocBuilder<TabBloc, TabState>(
          builder: (context, state) {
            return pages[state.currentIndex];
          },
        ),
        bottomNavigationBar: BottomNavigationWidget(),
      ),
    );
  }
}
