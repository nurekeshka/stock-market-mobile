import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_mobile/core/theme/colors.dart';

import '../../core/constants/icons.dart';
import '../../core/constants/tabs.dart';
import '../blocs/events/tabs_event.dart';
import '../blocs/states/tabs_state.dart';
import '../blocs/tabs_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor =
        Theme.of(context).bottomNavigationBarTheme.selectedItemColor ??
        DesignColors.electromagnetic.color;

    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentIndex,
          onTap: (index) {
            context.read<TabBloc>().add(TabChange(index));
          },
          items:
              tabs.values.map((pair) {
                return BottomNavigationBarItem(
                  icon: AppIcons.getIcon(pair.item1, textColor, 30),
                  label: pair.item2,
                  backgroundColor:
                      Theme.of(
                        context,
                      ).bottomNavigationBarTheme.backgroundColor,
                );
              }).toList(),
        );
      },
    );
  }
}
