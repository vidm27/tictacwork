import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tictac_work_app/config/theme/app_theme.dart';
import 'package:tictac_work_app/feature/timer/presentations/providers/counttime_provider.dart';
import 'package:tictac_work_app/feature/home/providers/tab_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {


  @override
  void initState()  {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    final TimerState timerState= ref.watch(timerProvider);
    final TabState tabState = ref.watch(tabProvider);

    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            timerState.isActivateTime ? AppStyle.accentColor : AppStyle.primaryColor,
        shape: const CircleBorder(),
        elevation: 0,
        onPressed: () {
          if (timerState.isActivateTime == false) {
            ref.read(timerProvider.notifier).startTimer();
          } else {
            ref.read(timerProvider.notifier).stopTimer();
          }
        },
        child: Icon(
          timerState.isActivateTime ? Icons.stop_rounded : Icons.play_arrow_rounded,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color(0xFFEFEDF5),
        height: 50,
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  ref.read(tabProvider.notifier).changeTab(0);
                },
                iconSize: 30,
                icon: tabState.currentTab == 0 ? const Icon(
                  Icons.timer,
                  // size: 30,
                ) : const Icon(
                  Icons.timer_outlined,
                  // size: 30,
                )),
            IconButton(
                onPressed: () {
                  ref.read(tabProvider.notifier).changeTab(1);
                },
                iconSize: 30,
                icon:  Icon(
                  tabState.currentTab == 1 ? Icons.pie_chart : Icons.pie_chart_outline,
                )),
            IconButton(
              iconSize: 30,
              onPressed: () {
                ref.read(tabProvider.notifier).changeTab(2);
              },
              icon: tabState.currentTab == 2 ? const Icon(
                Icons.calendar_month,
              ) : const Icon(
                Icons.calendar_month_outlined,
              ),
            ),
            IconButton(
                iconSize: 30,
                onPressed: () {
                  ref.read(tabProvider.notifier).changeTab(3);
                },
                icon:  Icon(
                  tabState.currentTab == 3 ? Icons.folder : Icons.folder_outlined,
                ))
          ],
        ),
      ),
      body: PageStorage(
          bucket: PageStorageBucket(), child: tabState.currentScreen),
    );
  }
}
