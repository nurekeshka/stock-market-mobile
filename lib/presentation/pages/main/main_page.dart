import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/states/tabs_state.dart';
import '../../blocs/tabs_bloc.dart';
import '../../widgets/bottom_navigation_widget.dart';
import './tabs/browse_page.dart';
import './tabs/home_page.dart';

class MainPage extends StatelessWidget {
  final List<Widget> pages = [
    HomeTab(),
    BrowseTab(),
    Center(child: Text('Charts')),
    Center(child: Text('Events')),
  ];

  MainPage({super.key});

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
