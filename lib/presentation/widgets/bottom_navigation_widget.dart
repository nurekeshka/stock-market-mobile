import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/tabs_constants.dart';
import '../blocs/tabs/tabs_bloc.dart';
import '../blocs/tabs/tabs_event.dart';
import '../blocs/tabs/tabs_state.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: (index) {
            context.read<TabBloc>().add(TabChanged(index));
          },
          items:
              tabsMap.values.map((pair) {
                return BottomNavigationBarItem(
                  icon: pair.item1,
                  label: pair.item2,
                );
              }).toList(),
        );
      },
    );
  }
}
