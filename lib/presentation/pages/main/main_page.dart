import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/states/tabs_state.dart';
import '../../blocs/tabs_bloc.dart';
import '../../widgets/bottom_navigation_widget.dart';
import './profile/profile_page.dart';
import './tabs/browse_page.dart';
import './tabs/charts_page.dart';
import './tabs/events_page.dart';
import './tabs/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  bool _showProfile = false;

  late final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _build(),
        if (_showProfile) ...[
          // Blur effect over Home
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withValues(alpha: 0.4)),
          ),
          // Profile screen over blurred background
          ProfilePage(onClose: _toggleProfile),
        ],
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    pages = [
      HomeTab(onProfileTap: _toggleProfile),
      BrowseTab(),
      ChartsPage(),
      EventsPage(),
    ];
  }

  Widget _build() {
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

  void _toggleProfile() {
    setState(() {
      _showProfile = !_showProfile;
    });
  }
}
