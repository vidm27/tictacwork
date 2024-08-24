// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tictac_work_app/feature/calendar/screens/calendar_screen.dart';
import 'package:tictac_work_app/feature/portfolio/screen/portfolio_screen.dart';
import 'package:tictac_work_app/feature/report/screen/report_screen.dart';
import 'package:tictac_work_app/feature/timer/presentations/screens/timer_screen.dart';

class TabState {
  final int currentTab;
  final Widget currentScreen;

  TabState({required this.currentTab, required this.currentScreen});

  TabState copyWith({
    int? currentTab,
    Widget? currentScreen,
  }) {
    return TabState(
      currentTab: currentTab ?? this.currentTab,
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }
}

class TabProvider extends StateNotifier<TabState> {
  TabProvider()
      : super(TabState(currentTab: 0, currentScreen:  TimerScreen()));

  void changeTab(int index) {
    Widget newScreen;
    switch (index) {
      case 0:
        newScreen =  TimerScreen();
        break;
      case 1:
        newScreen = const ReportScreen();
        break;
      case 2:
        newScreen = const CalendarScreen();
        break;
      case 3:
        newScreen = const PortfolioScreen();
        break;
      default:
        newScreen =  TimerScreen();
        break;
    }
    state = state.copyWith(currentTab: index, currentScreen: newScreen);
  }
}

final tabProvider = StateNotifierProvider<TabProvider, TabState>((ref) {
  return TabProvider();
});
